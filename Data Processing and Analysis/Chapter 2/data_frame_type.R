## Data Frame
(d <- data.frame(x = c(1,2,3,4,5), y = c(2,4,6,8,10)))

(d <- data.frame(x = c(1,2,3,4,5), y = c(2,4,6,8,10), z = c('M','F','M','F','M'), stringsAsFactors = TRUE)) 
str(d)  # stringsAsFactors = TRUE means setting string as a format of factor
d$x
d$x <- 6:10
d
d$w <- c("A","B","C","D","E")
d
str(d)

(x <-  data.frame(1:3))
colnames(x) <- c('val')
rownames(x) <- c('a','b','c')

# access the frame
(d <- data.frame(x = c(1,2,3,4,5), y = c(2,4,6,8,10)))
d$x
d[1, ]
d[1, 2]
d[c(1,3), 2]
d[-1, -2]

d[, c("x","y")]
d[, c("x")]                     # give as a vector
d[, c("x"), drop = FALSE]       # give as a column

(d <- data.frame(a = 1:3, b = 4:6, c = 7:9))
d[, names(d) %in% c("b","c")]   # find the columns with names b, c
d[, !names(d) %in% c("a")]      # find the columns without names a

# utility
d <- data.frame(x = 1:1000)
head(d)
tail(d)
View(d)

## Type Check and Change
class(c(1,2))
class(matrix(c(1,2)))
class(data.frame(x = c(1,2), y = c(3,4)))

str(c(1,2))
str(matrix(c(1,2)))
str(list(c(1,2)))
str(data.frame(x = c(1,2)))

is.factor(factor(c("m","f")))
is.numeric(1:5)
is.character(c("a","b"))
is.data.frame(data.frame(x = 1:5))

# change a type
x <- c("a","b","c")
class(x)
as.factor(x)
as.character(as.factor(x))

x <- matrix(1:9, ncol = 3)
x
as.data.frame(x)

(x <- data.frame(matrix(c(1,2,3,4), ncol = 2)))
(x <- data.frame(list(x = c(1,2), y = c(3,4))))

factor(c("m", "f"), levels = c("m", "f"))
