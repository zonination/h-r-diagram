# Hertzsprung-Russell Diagram with 119,614 datapoints

## About

Got bored with a lot of the Hertzsprung–Russell diagrams out there, so I made and animated my own using 119,614 data points in a star catalog.

Stars twinkle for two reasons:

* Aesthetics
* Reduces overploting

## Graphic

![Animated GIF](https://raw.githubusercontent.com/zonination/h-r-diagram/master/twinkle.gif)

## Notes:

If you're going to play with this:

* Make sure you have ImageMagick installed
* the last line is optimized to work with unix-like systems (Linux/Mac, basically). If you have Windows, replace it with `DEL star_anim*.png`
* make sure the second line has the correct working directory under `setwd()`.

## Sources:

* The [HYG database](http://www.astronexus.com/hyg)

[More info on H-R Diagrams from Wikipedia](https://en.wikipedia.org/wiki/Hertzsprung%E2%80%93Russell_diagram)

## Tools used:

* ggplot2
* Rstudio

# Other Information:

[Reddit thread](https://np.reddit.com/r/dataisbeautiful/comments/433960/got_bored_with_a_lot_of_the_hertzsprungrussell/)

I'm told that this star catalog may potentially contain inaccurate information. [See comments here](https://np.reddit.com/r/dataisbeautiful/comments/433960/got_bored_with_a_lot_of_the_hertzsprungrussell/czfres5?context=3).
