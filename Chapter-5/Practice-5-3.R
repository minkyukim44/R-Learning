## Write Derived Variables

df <- data.frame(var1 = c(4,3,8),
                 var2 = c(2,6,1))
df

df$var_sum <- df$var1 + df$var2         # generate the sum of var1 and var2
df

df$var_mean <- (df$var1 + df$var2)/2    # generate the mean of the sum 
df

# use "mpg"

mpg <- as.data.frame(ggplot2::mpg)
mpg

mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)
mpg <- select(mpg, -12)                 # ("select" from dplyr) remove the selected twelveth column
head(mpg)

mean(mpg$total)

# use if-statements 

summary(mpg$total)

hist(mpg$total)         # generate a histogram

mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")     # if total >=20, then pass, else fail

head(mpg, 20)

table(mpg$test)         # fuel efficieny pass/fail 
library(ggplot2)
qplot(mpg$test)         # generate a bar graph

# use complicated if statements

mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))  # A as total>=30, B as 30>total>=20, C as 20>total
head(mpg,20)

table(mpg$grade)
qplot(mpg$grade)

# more
mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                        ifelse(mpg$total >= 25, "B",
                               ifelse(mpg$total >= 20, "C", "D")))
head(mpg,20)

table(mpg$grade2)
qplot(mpg$grade2)
