## Matrix
matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3)
matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, byrow = TRUE)    # fill columns first
matrix(c(1,2,3,4,5,6,7,8,9), ncol = 3)

# name rows and columns
matrix(1:9, nrow = 3, dimnames = list(c("r1","r2","r3"), c("c1","c2","c3")))

(x <- matrix(1:9, ncol = 3))
dimnames(x) <- list(c("r1","r2","r3"), c("c1","c2","c3"))
x

# access data
(x <- matrix(1:9, ncol = 3))
x[1,1]
x[1,2]
x[2,1]
x[2,2]

x[1:2, ]            # show the first and second rows
x[-3, ]             # exclude the third row
x[c(1,3), c(1,3)]   # show the first and third rows and the first and third columns

# matrix calculation
(x <- matrix(1:9, ncol = 3))

x * 2   # scalar
x / 2 

x + x   # matrix
x - x
x * x   # multiple each element

x %*% x # matrix multiplication

t(x)    # transpose

(x <- matrix(1:4, ncol = 2))
det(x)      # find determinant
solve(x)    # inverse matrix
x %*% solve(x)

# check dimensions
(x <- matrix(1:6, ncol = 3))
nrow(x)
ncol(x)
dim(x)

dim(x) <- c(3,2)    # change dimension
x

## Array
(x <- array(1:12, dim = c(2,2,3)))
x[1,1,1]
x[1,2,3]
x[, ,3]
dim(x)
