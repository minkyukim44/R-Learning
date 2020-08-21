## Data Manipulation
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

df1 <- data.frame(x = c(1,2,3), y = c("Mr. Foo", "Ms. Bar", "Mr. Baz"), z = c(95,97,92),stringsAsFactors = TRUE)
names(df1) <- NULL
df1
colnames(df1) <- c("id","name","score")
str(df1)
write.csv(df1, "b.csv")
(x <- read.csv("b.csv"))
