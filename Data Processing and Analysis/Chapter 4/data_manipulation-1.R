## Data Manipulation-1
head(iris)
str(iris)

iris3
data(mtcars)
head(mtcars)

df <- data.frame(x = c(1,2,3), y = c("Mr. Foo", "Ms. Bar", "Mr. Baz"), z = c(95,97,92), stringsAsFactors = TRUE)
colnames(df) <- c("id","name","score")
str(df)
write.csv(df, "a.csv", row.names = FALSE)
x <- read.csv("a.csv", stringsAsFactors = TRUE)
str(x)

# without header (study later more)
df1 <- data.frame(x = c(1,2,3), y = c("Mr. Foo", "Ms. Bar", "Mr. Baz"), z = c(95,97,92),stringsAsFactors = TRUE)
names(df1) <- NULL
df1
colnames(df1) <- c("id","name","score")
str(df1)
write.csv(df1, "b.csv")
(x <- read.csv("b.csv", header = FALSE))

# NA
df2 <- data.frame(x = c(1,2,3), y = c("Mr. Foo", "Ms. Bar", "Mr. Baz"), z = c(95,"NIL",92),stringsAsFactors = TRUE)
names(df2) <- c("id","name","score")
write.csv(df2, "c.csv", row.names = FALSE)      # write without row names
x <- read.csv("c.csv", stringsAsFactors = TRUE, na.strings = c("NIL"))
str(x)
is.na(x$score)
write.csv(x, "d.csv", row.names = FALSE)

# save, load
x <- 1:5
y <- 6:10
save(x,y, file = "xy.RData")
rm(list = ls())
load("xy.RData")


## rbind, cbindrbind
rbind(c(1,2,3), c(4,5,6))

(x <- data.frame(id = c(1,2), name = c("a","b"), stringsAsFactors = F))
str(x)
(y <- rbind(x, c(3,"c")))

cbind(c(1,2,3), c(4,5,6))
y <- cbind(x, greek = c("alpha", "beta"), stringsAsFactors = T)
str(y)
