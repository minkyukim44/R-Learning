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

# Q-8-2

mpg
mpg_cty<- mpg %>% 
    filter(class == "suv") %>% 
    group_by(manufacturer) %>% 
    summarise(mean_cty = mean(cty)) %>% 
    arrange(desc(mean_cty)) %>% 
    head(5)

ggplot(data = mpg_cty, aes(x = reorder(manufacturer, -mean_cty), y = mean_cty)) + geom_col()
ggplot(data = mpg, aes(x = class)) + geom_bar()

# Q-8-3

library(ggplot2)

ggplot(data = economics, aes(x = date, y = psavert)) + geom_line()

# Q-8-4

library(ggplot2)

ggplot(data = mpg, aes(x = class, y = cty)) + geom_boxplot()
       