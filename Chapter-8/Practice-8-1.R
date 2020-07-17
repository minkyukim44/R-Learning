## Scatter Plot

library(ggplot2)


ggplot(data = mpg, aes(x = displ, y = hwy))                                 # make a background
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()                  # add up points
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3,6)      # give a limit to x-axis
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
    geom_point() + 
    xlim(3,6) +
    ylim(10, 30)                                                            # give a limit to y-axis

## Bar Plot

library(dplyr)

options(digit = 7)
mpg <- as.data.frame(ggplot2::mpg)

df_mpg <- mpg %>% 
    group_by(drv) %>% 
    summarise(mean_hwy = mean(hwy))
df_mpg$mean_hwy <- df_mpg$mean_hwy %>% round(df_mpg$mean_hwy,2)
df_mpg

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) +         # reorder : re-arrangement the order
    geom_col()          # bar plot

ggplot(data = mpg, aes(x = drv)) + geom_bar()       # frequency bar plot
ggplot(data = mpg, aes(x = hwy)) + geom_bar()

## Line Chart
       
library(ggplot2)
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

## Box Plot

ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()
            
       