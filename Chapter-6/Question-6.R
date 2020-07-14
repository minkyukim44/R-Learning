# Questions
# Q-6-2

mpg <- as.data.frame(ggplot2::mpg)

displ_4 <- mpg %>% filter(mpg$displ <= 4)
displ_5 <- mpg %>% filter(mpg$displ >= 5)

mean(displ_4$hwy)
mean(displ_5$hwy)

man_audi <- mpg %>% filter(mpg$manufacturer == "audi")
man_toyota <- mpg %>% filter(mpg$manufacturer == "toyota")

mean(man_audi$cty)
mean(man_toyota$cty)

manu_cars <- mpg %>% filter(mpg$manufacturer %in% c("chevrolet", "ford" , "honda"))
mean(manu_cars$hwy)
