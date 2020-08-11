## Variables

# do not use "-" for names of variables

mean(x <- c(1,2,3))
x
rm(x)

mean(x = c(1,2,3))      # when use "=" instead of "<-", values are not stored in x
x

## scalar
# numbers
a <- 3
b <- 4.5
c <- a + b
print(c)

# NA
four <- NA
is.na(four) # check the variable is NA
is.na(a)

# NULL
x <- NULL
is.null(x)
is.null(1)
is.null(NA)
is.na(NULL)

# character
a <- "hello"
print(a)
a <- 'hello'
print(a)

# Boolean
TRUE & TRUE
TRUE & FALSE
TRUE | TRUE
TRUE | FALSE
!TRUE
!FALSE

T <- FALSE
TRUE <- FALSE   # error

c(TRUE, TRUE) & c(TRUE, FALSE)
c(TRUE, TRUE) && c(TRUE, FALSE)     # do for the first element

# factor (categorized)
sex <- factor("m", c("m","f"))      # m, f are levels
sex
nlevels(sex)
levels(sex)
levels(sex)[1]      # an index is starting from "1"
levels(sex)[2]

levels(sex) <- c("male", "female")
sex

factor(c("m","m","f"), c("m","f"))
factor(c("m","m","f"))      # automatically categorized

ordered("a", c("a","b","c"))
