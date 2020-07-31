## varaible types
# continuous variable(numeric)
# categorical variabel(factor)
var1 <- c(1,2,3,1,2)
var2 <- factor(c(1,2,3,1,2))

var1
var2            # show categories

var1+2
var2+2          # error

class(var1)     # check a variable type
class(var2)

levels(var1)    # check categoires
levels(var2)

var3 <- c("a","b","b","c")
var4 <-factor(c("a","b","b","c"))

var3
var4

class(var3)
class(var4)

mean(var1)
mean(var2)      # error

var2 <- as.numeric(var2)    # change to a numeric type
mean(var2)
class(var2)
levels(var2)

# question
mpg <- as.data.frame(ggplot2::mpg)
library(ggplot2)
class(mpg$drv)
drv <- as.factor(mpg$drv)
class(drv)
drv
