## Function
fibo <- function(n){        # fibonacci function
    if (n == 1 || n == 2){
        return(1)
    }
    return(fibo(n - 1) + fibo(n - 2))
}
fibo(1)
fibo(2)
fibo(3)
fibo(5)

f <- function(x,y){
    print(x)
    print(y)
}
f(1,2)
f(y = 2, x = 1)

# variable length factor
f <- function(...){
    args <- list(...)
    for (a in args){
        print(a)
    }
}
f('3','4')
f(3,4)

g <- function(z,...){
    print(z)
    f(...)
}
g(1,2,3)

# nested function
f <- function(x,y){
    print(x)
    g <- function(y){
        print(y)
    }
    g(y)
}
f(1,2)

f <- function(x1){
    return(function(x2){
        return(x1 + x2)
    })
}
g <- f(1)   # g(x) = 1 + x
g(2)        # g(2) = 1 + 2

g2 <- f(2)  # g2(x) = 2 + x
g2(2)

## Scope
n <- 1
f <- function(){
    print(n)
}
f()
n <- 2
f()

n <- 100
f <- function(){
    n <- 1
    print(n)
}
f()     # f() = 1 even though n = 100 at the outside of the function

rm(list = ls())     # remove all objects in the memory
f <- function(){
    print(n)
}
f()     # nothing

f <- function(){
    n <- 1
}
f()
n       # cannot access the object inside the function

n <- 100
f <- function(n){
    print(n)
}
f(1)

f <- function(x){
    a <- 2
    g <- function(y){
        print(y + a)
    }
    g(x)
}
f(1)

a <- 100
f <- function(x){
    g <- function(y){
        print(y + a)
    }
    g(x)
}
f(1)

f <- function(){
    a <- 1
    g <- function(){
        a <- 2
        print(a)
    }
    g()
    print(a)
}
f()     # show two different a's

b <- 0
f <- function(){
    a <- 1
    g <- function(){
        a <<- 2             # assign a = 2 in the function f()
        b <<- 2
        print(a)
        print(b)
    }
    g()
    print(a)
    print(b)
}
f()

## Pass by Value
f <- function(df2){
    df2$a <- c(1,2,3)
}
df <- data.frame(a = c(4,5,6))
(f(df))
df

f <- function(df){
    df$a <- c(1,2,3)
    return(df)
}
df <- data.frame(a = c(4,5,6))
df <- f(df)
df

## Immutable Object
a <- list()
tracemem(a)         # tracing memory address
a$b <- c(1,2,3)     # memory copy occurs and an new object is generated
untracemem(a)

v <- 1:1000
tracemem(v)
for (i in 1:1000){
    v[i] <- v[i] + 1
}
untracemem(v)

v <- 1:1000
tracemem(v)
v <- v + 1          # memory use in vector calucluation is smaller than for-statement
untracemem(v)

rm(list = ls())
gc()                # release unusable memory
v <- 1:99999999
for (i in 1:99999999){
    for (j in 1:99999999){
        v[j] <- v[j] + 1
    }
}


## Module Pattern
# queue (first in first out)
q <- c()
q_size <- 0
enqueue <- function(data) {
    q <<- c(q, data)
    q_size <<- q_size + 1
}
dequeue <- function() {
    first <- q[1]
    q <<- q[-1]
    q_size <<- q_size - 1
    return(first)
}
size <- function() {
    return(q_size)
}

enqueue(1)
enqueue(3)
enqueue(5)
print(size())
print(dequeue())
print(dequeue())
print(dequeue())
print(size())

# write a queue module
enqueue(1)
q <- c(q, 5)
dequeue()
dequeue()
size()  # a size becomes '-1'

queue <- function(){
    q <- c()
    q_size <- 0
    
    enqueue <- function(data){
        q <<- c(q, data)
        q_size <<- q_size + 1
    }    
    
    dequeue <- function() {
        first <- q[1]
        q <<- q[-1]
        q_size <<- q_size - 1
        return(first)
    }
    
    size <- function() {
        return(q_size)
    }

    return(list(enqueue = enqueue, dequeue = dequeue, size = size))
}

q <- queue()
q$enqueue(1)
q$enqueue(3)
q$size()
q$dequeue()
q$dequeue()
q$size()

r <- queue()
q$enqueue((1))
r$size()
r$enqueue(3)
q$dequeue()
r$dequeue()
q$size()
r$size()
