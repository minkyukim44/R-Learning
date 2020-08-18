## Vectors
(x <- c(1,2,3,4,5)) # with parantheses, printing is automatically done.
(x <- c("1","2","3"))
c(1,2,3,c(1,2,3))   

x <- c(1,3,4)
names(x) <- c("kim","seo","park")   # naming each element

x <- c("a","b","c")
x[1]
x[3]
x[-1]       # exclude the first element
x[-2]
x[c(1,2)]   # show the first and second elements
x[c(1,3)]
x[1:2]
x[1:3]

x <- c(1,3,4)            
names(x) <- c("kim","seo","park") 
x["seo"]
x[c("seo","park")]
names(x)[2]

x <- c("a","b","c")
length(x)
nrow(x)     # only for martixes
NROW(x)     # for matrixes and vectors

# vector calculation
identical(c(1,2,3), c(1,2,3))
identical(c(1,2,3), c(1,2,100))

"a" %in% c("a","b","c")
"d" %in% c("a","b","c")

x <- c(1,2,3,4,5)
x + 1       # do for all elements
10 - x

c(1,2,3) == c(1,2,100)  # do for each element
c(1,2,3) != c(1,2,100)

union(c("a","b","c"), c("a","d"))
intersect(c("a","b","c"), c("a","d"))
setdiff(c("a","b","c"), c("a","d"))     # difference

setequal(c("a","b","c"), c("a","d"))    # compare the equality of two groups
setequal(c("a","b","c"), c("a","b","c","c"))

# sequence
seq(3,7)
seq(7,3)
seq(3,7,2)  # increase by 2
seq(3,7,3)

3:7         # short cut for increasing by 1
7:3

x <- c(2,4,6,8,10)    
1:NROW(x)
seq_along(x)    # generate a sequence with the length of x

# repeating elements
rep(1:2, times = 5)
rep(1:2, each = 5)
rep(1:2, each = 5, times = 2)   # repeat each number 5 times and repeat all again 2 times

## List
(x <- list(name = "foo", height = 70))
(x <- list(name = "foo", height = c(1,3,5)))
list(a = list(val = c(1,2,3)), b = list(val = c(1,2,3,4)))

(x <- list(name = "foo", height = c(1,3,5)))
x$name
x$height
x$height[1]
x[1]
x[2]
x[[1]]
x[[2]]
