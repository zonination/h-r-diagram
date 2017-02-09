#Set working directory, open files, fire up the libraries
# setwd("~/Dropbox/R/Star Catalog")
catalog <- read.csv("hygdata_v3-1.csv",sep=",", stringsAsFactors=FALSE,header=TRUE)
catalog <- rbind(catalog,read.csv("hygdata_v3-2.csv",sep=",", stringsAsFactors=FALSE,header=TRUE))
library(ggplot2)
source("z_theme.R")

# Set a randomseed to make the stars twinkle
catalog$randomseed<-runif(nrow(catalog),min=0,max=2*pi)

# This for() loop will step through 36 frames of the gif,
# to later be merged.
for(n in seq(0,360,10)){
print(
  # Form our plot:
  ggplot(catalog,aes(ci,absmag))+
    # Print data points:
    geom_point(shape=16, size=.001, aes(alpha=(sin(randomseed+n*pi/180)), color=ci))+
    # X and Y axis:
    scale_x_continuous(limits=c(-.5,2.5))+
    scale_y_reverse()+
    # Scale guides and colors:
    guides(color=F, alpha=F)+
    scale_alpha_continuous(range=c(0,1))+
    scale_color_gradientn(
      colours=c("blue","skyblue","white","orange","red"),
      limits= c(-.5,2.5))+
    # Axis labels and title:
    labs(title="Hertzsprung–Russell Diagram",
        subtitle="Classification of Stars",
         y="Absolute Magnitude",
        x="Color Index (B-V)",
        caption="created by /u/zonination")+
    # Adding text for character:
    annotate("text",x=0,y=15,label="White Dwarfs",size=4,hjust=0,vjust=0,color="white")+
    annotate("text",x=1.75,y=12,label="Main Sequence",size=4,hjust=0,vjust=0,color="white")+
    annotate("text",x=1.75,y=0,label="Giants",size=4,hjust=0,vjust=0,color="white")+
    annotate("text",x=1.75,y=-10,label="Supergiants",size=4,hjust=0,vjust=0,color="white")+
    z_theme())
  # Save the frame, and declare our status:
  ggsave(paste("star_anim", formatC(n,width=3,flag = "0"), ".png", sep=""), height=9, width=6, dpi=100, type="cairo-png")
  print(paste(n, "of", 360, "degrees completed."))
}; rm(n)

# Convert the individual frames into a gif, then remove the individual frames.
system("convert -delay 10 star_anim*.png twinkle.gif")
system("rm star_anim*.png")