## doBy package
install.packages("doBy")
library(doBy)

summary(iris)
quantile(iris$Sepal.Length)
quantile(iris$Sepal.Length, seq(0, 1, by = 0.1))

# summaryBy
summaryBy(Sepal.Width + Sepal.Length ~ Species, iris, FUN = c(mean, sd, var))

# orderBy
order(iris$Sepal.Width)
iris[order(iris$Sepal.Width),]
iris[order(iris$Sepal.Width, iris$Petal.Width),]

orderBy(~ Sepal.Width, iris)
orderBy(~ Species + Sepal.Width, iris)

# sampleBy
sample(1:10, 5)
sample(1:10, 5, replace = T)

sample(1:10,10)     # random shuffle

iris[sample(NROW(iris), NROW(iris)),]

sampleBy(~ Species, frac = 0.1, data = iris)    # sampling 10% of each species 
