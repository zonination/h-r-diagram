#Set working directory, open files, fire up the libraries
setwd("~/Dropbox/R/Star Catalog")
catalog <- read.csv("hygdata_v3-1.csv",sep=",", stringsAsFactors=FALSE,header=TRUE)
catalog <- rbind(catalog,read.csv("hygdata_v3-2.csv",sep=",", stringsAsFactors=FALSE,header=TRUE))
library(ggplot2)

z_theme <- function() {
  theme_bw(base_size=9) +
    #Background and Grid formatting
    theme(panel.background=element_rect(fill="#000000", color="#000000")) +
    theme(plot.background=element_rect(fill="#000000", color="#000000")) +
    theme(panel.border=element_rect(color="#252525")) +
    theme(panel.grid.major=element_blank()) +
    theme(panel.grid.minor=element_blank()) +
    #Legend formatting
    theme(legend.background = element_rect(fill="#000000")) +
    theme(legend.text = element_blank()) +
    theme(legend.title= element_blank())+
    theme(legend.position="none")+
    #Axis & Title Formatting
    theme(plot.title=element_text(color="#D9D9D9", size=20, vjust=1.25)) +
    theme(axis.ticks=element_blank()) +
    theme(axis.text.x=element_text(size=14,color="#BDBDBD")) +
    theme(axis.text.y=element_text(size=14,color="#BDBDBD")) +
    theme(axis.title.x=element_text(size=16,color="#BDBDBD", vjust=0)) +
    theme(axis.title.y=element_text(size=16,color="#BDBDBD", vjust=1.25))
}

catalog$randomseed<-runif(nrow(catalog),min=0,max=2*pi)
for(n in seq(0,360,10)){
if(n<100){png(file=paste("star_anim0",n,".png",sep=""), width=600, height=900)
  }else{png(file=paste("star_anim",n,".png",sep=""), width=600, height=900)}
print(
  ggplot(catalog,aes(ci,absmag))+
  geom_point(shape=".",aes(alpha=sin(randomseed+n*pi/180), color=ci))+
  scale_y_reverse()+
  scale_color_gradientn(
    colours=c("blue","skyblue","white","orange","red"),
    limits= c(-.5,2.5))+
  scale_x_continuous(limits=c(-.5,2.5))+
  ggtitle("Hertzsprung–Russell Diagram")+
  ylab("Absolute Magnitude")+
  xlab("Color Index (B-V)")+
  annotate("text",x=0,y=15,label="White Dwarfs",size=4,hjust=0,vjust=0,color="white")+
  annotate("text",x=2,y=12,label="Main Sequence",size=4,hjust=0,vjust=0,color="white")+
  annotate("text",x=2,y=0,label="Giants",size=4,hjust=0,vjust=0,color="white")+
  annotate("text",x=2,y=-10,label="Supergiants",size=4,hjust=0,vjust=0,color="white")+
  z_theme()
  )
dev.off()
}
system("convert -delay 10 star_anim*.png twinkle.gif")
system("rm star_anim*.png")