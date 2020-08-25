## Data Manipulation-2
# 'apply' functions
# apply()
sum(1:10)
d <- matrix(1:9, ncol = 3)
apply(d, 1, sum)            # MARGIN = 1 means summing by row
apply(d, 2, sum)            # MARGIN = 2 means summing by col

head(iris)
apply(iris[, 1:4], 2, sum)

colSums(iris[, 1:4])        # rowSums, rowMeans, colSums, colMeans

# lapply() return in a list
(result <- lapply(1:3, function(x)(x*2)))
result[[1]]
unlist(result)  # convert a list to a vector

(x <- list(a = 1:3, b = 4:6))
lapply(x, mean)

str(lapply(iris[, 1:4], mean))      # the result is a list
str(colMeans(iris[, 1:4]))          # the reulst is returning values

d <- as.data.frame(matrix(unlist(lapply(iris[,1:4], mean)), ncol = 4, byrow = T))
names(d) <- names(iris[, 1:4])
str(d)  # the result is a data frame

data.frame(do.call(cbind, lapply(iris[, 1:4], mean))) # shortcut

(x <- list(data.frame(name = "foo", value = 1), data.frame(name = "bar", value = 2)))
unlist(x)
do.call(rbind, x)       # use do.call as data types are various

# sapply() return in a vector or a data frame or a matrix
class(lapply(iris[, 1:4], mean))    # class: list
class(sapply(iris[, 1:4], mean))    # class: numeric vector
          
x <- sapply(iris[, 1:4], mean)
as.data.frame(x)
as.data.frame(t(x))

sapply(iris, class)     # check class for each column

y <- sapply(iris[, 1:4], function(x){x >3})
class(y)
head(y)

# tapply() apply a function for each group
tapply(1:10, rep(1, 10), sum)   # grouping for all
tapply(1:10, 1:10 %% 2, sum)

tapply(iris$Sepal.Length, iris$Species, mean)

m <- matrix(1:8, ncol = 2, dimnames = list(c("spring","summer","fall","winter"), c("male","female")))
m
tapply(m, list(c(1,1,2,2,1,1,2,2),c(1,1,1,1,2,2,2,2)), sum)

# mapply() 
rnorm(10,0,1)   # 10 random numbers with mean = 0, sd = 1
mapply(rnorm, c(1,2,3), c(0, 10, 100), c(1,1,1))
mapply(mean, iris[, 1:4])


