## Seize Data

getwd()
setwd("C:/Users/user/Desktop/Programming/R-programming/Chapter-5")
getwd()

exam <- read.csv("csv_exam.csv")
exam

head(exam)      # Show the first six rows
head(exam, 10)  # Show the first ten rows

tail(exam)      # Show the last six rows
tail(exam, 10)  # Show tha last ten rows

View(exam)      # View "exam" dataset, "v" should be capitalized

dim(exam)       # Show the number of columns and rows

str(exam)       # Show the property of the dataset
                # Obs: the number of rows, Variables: the number of columns, int: integer, chr: character. num: numeric

summary(exam)   # Show the summary of statistical information
                # 1st Qu: 1st Quantile(25%), 3rd Qu: 3rd Quantile
                # length: the number of values, class, mode: the property of variables


## Seize "mpg" data

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
?mpg      # show the description of "mpg" 

head(mpg)
tail(mpg)
View(mpg)

dim(mpg)
str(mpg)
summary(mpg)
