## Questions
# Q-5-2

library(ggplot2)
#or mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)


mpg_fix <- mpg
mpg_fix <- rename(mpg_fix, city = cty)
mpg_fix <- rename(mpg_fix, highway = hwy)

mpg_fix
mpg

# Q-5-3
midwest <- as.data.frame(ggplot2::midwest)
midwest

dim(midwest)
str(midwest)
?midwest
summary(midwest)

midwest_change <- midwest
midwest_change <- rename(midwest_change, total = poptotal)
midwest_change <- rename(midwest_change, asian = popasian)

midwest_change$ratio_asian <- midwest_change$asian/midwest_change$total

mean(midwest_change$ratio_asian)
midwest_change$size <- ifelse(midwest_change$ratio_asian >= mean(midwest_change$ratio_asian),"Large", "Small")
midwest_change

table(midwest_change$size)
qplot(midwest_change$size)
