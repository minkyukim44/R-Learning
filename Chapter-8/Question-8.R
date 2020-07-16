## Questions
# Q-8-1

library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)
ggplot(mpg, aes(cty, hwy)) + 
    geom_point()

midwest <- as.data.frame(ggplot2::midwest)
ggplot(midwest, aes(poptotal, popasian)) +
    geom_point() +
    xlim(0,5e+5) +
    ylim(0,1e+4)


