## Data Structure
# Vector
a <- 1
a
class(a)

b <- "hello"
b
class(b)

# Data Frame
x1 <- data.frame(var1 = c(1,2,3),
                 var2 = c("a","b","c"))
x1
class(x1)

# Matrix
x2 <- matrix(c(1:12), ncol = 2)
x2
class(x2)

# Array
x3 <- array(1:20, dim = c(2,5,2))   # 2 rows, 5 columns, 2 dimensions
x3
class(x3)

# List
x4 <- list(f1 = a,
           f2 = x1,
           f3 = x2, 
           f4 = x3)
x4
class(x4)

# etc
mpg <- ggplot2::mpg
x <- boxplot(mpg$cty)   # x is a "list"
x

x$stats[,1]
x$stats[,1][3]
x$stats[,1][2]
