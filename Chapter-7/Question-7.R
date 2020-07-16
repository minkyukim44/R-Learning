## Questions
# Q-7-1

mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA

table(mpg$drv)
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

mpg <- mpg %>% filter(!is.na(mpg$hwy))
table(is.na(mpg$hwy))

library(dplyr)
mpg %>% 
    filter(!is.na(hwy)) %>% 
    group_by(drv) %>% 
    summarise(mean_hwy = mean(hwy))

# Q-7-2
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), "drv"] <- "k"
mpg[c(29,43,129,203), "cty"] <- c(3,4,39,42)

table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% c("k"), NA, mpg$drv)

boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty <9 | mpg$cty >26, NA, mpg$cty)

mpg_nomiss <- mpg %>% 
    filter(!is.na(drv) & !is.na(cty)) %>% 
    group_by(drv) %>% 
    summarise(mean_cty = mean(cty))

mpg_nomiss
              