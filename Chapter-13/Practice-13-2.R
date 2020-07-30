## t-test

# prepare packages
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)
mpg_diff <- mpg %>% 
    select(class, cty) %>% 
    filter(class %in% c("compact", "suv"))
head(mpg_diff)
table(mpg_diff$class)

# t-testing
t.test(data = mpg_diff, cty ~ class, var.equal = T)     # "var.equal = T" means that deviations are same

# different cases
mpg_diff2 <- mpg %>% 
    select(fl, cty) %>% 
    filter(fl %in% c("r", "p"))
table(mpg_diff2$fl)

t.test(data = mpg_diff2, cty ~ fl, var.equal = T)
