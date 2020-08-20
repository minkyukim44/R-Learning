## Condition Statement
# if-statement
if (TRUE) {
    print("TRUE")
    print("Hello")
} else {
    print("FALSE")
    print("world")
}

x <- c(1,2,3,4,5)
ifelse(x %% 2 == 0, "even", "odd")      # for various data, use ifelse()

# repeating statement
for (i in 1:10){
    print(i)
}

i <- 1
while(i <=10){
    print(i)
    i <- i+1
}

i <- 0
while(i <= 9){
    i <- i+1
    if(i %% 2 != 0){
        next    # skip when i is odd
    }
    print(i)
}

i<- 1
repeat{
    print(i)
    if (i >= 10){
        break
    }
    i <- i + 1
}

## Computation
1:5*2+1

# vector computation
x <- c(1,2,3,4,5)

x + 1
x + x
x == x
x == c(1,2,3,5,5)
c(T,T,T) & c(T,F,T)

sum(x)
mean(x)
median(x)

(d <- data.frame(x = c(1,2,3,4,5), y = c("a","b","c","d","e")))
d[c(T,F,T,F,T), ]       # take elements where the element has T
d[d$x %% 2 == 0, ]      # take elements where the index has an even number

# NA
NA + T
NA + 1

sum(c(1,2,3,NA))
sum(c(1,2,3,NA), na.rm = TRUE)  # do summation without NA

(x <- data.frame(a = c(1,2,3), b = c("a",NA,"c"), c = c("a","b",NA)))
na.fail(x)      # fail when NA exists in the frame
na.omit(x)      # remove rows where NA exists
na.exclude(x)   # remove rows where NA exists
na.pass(x)      # pass even though NA exists in the frame

df <- data.frame(x = 1:5, y = seq(2,10,2))
df[3,2] = NA
df

resid(lm(y ~ x, data = df, na.action = na.omit))        # show a result without the row with NA
resid(lm(y ~ x, data = df, na.action = na.exclude))     # show a result with the row with NA
