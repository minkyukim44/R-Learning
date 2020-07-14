## extract desired data

library(dplyr)
exam <- read.csv("csv_exam.csv")
exam

exam %>% filter(class == 1)     # extract rows with "a class is equal to 1" from "exam"
exam %>% filter(class == 2)

exam %>% filter(class != 1)     # extract rows with "a class is not equal to 1" from "exam"
exam %>% filter(class != 3)

exam %>% filter(math > 50)      # extract rows with "a math is more than 50" from "exam"
exam %>% filter(math < 50) 
exam %>% filter(english >= 80) 
exam %>% filter(english <= 80) 

exam %>% filter(class == 1 & math >= 50)        # "&" : and
exam %>% filter(class == 2 & english >= 80)  

exam %>% filter(math >= 90 | english >= 90)     # "|" : or
exam %>% filter(english < 90 | science < 50)

exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1,3,5))            # extract as class == 1 or 3 or 5

class1 <- exam %>% filter(class == 1)           # assign rows from exam to class1 as class == 1
class1
class2 <- exam %>% filter(class == 2)
class2
mean(class1$math)
mean(class2$math)
