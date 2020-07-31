## practice built-in functions in R

exam <- read.csv("csv_exam.csv")
exam[]

# row indexing
exam[1,]        # extract the first row
exam[2,]

# conditions
exam[exam$class == 1,]                          # extract rows with a class equal to "1"
exam[exam$math >= 80,]                          # extract rows with a math score greater than 80
exam[exam$class == 1 & exam$math >= 50,]        # set multiple conditions
exam[exam$english < 90 | exam$science < 50,]

# column indexing
exam[,1]
exam[,2]
exam[,3]

# extract by a name of a variable
exam[,"class"]
exam[,"math"]
exam[,c("class", "math", "english")]

# extract both row and column
exam[1,3]
exam[5, "english"]
exam[exam$math >= 50, "english"]
exam[exam$math >= 50, c("english", "science")]

# question
mpg <- as.data.frame(ggplot2::mpg)

mpg$tot <- (mpg$cty + mpg$hwy)/2
aggregate(data = mpg[mpg$class == "compact" | mpg$class == "suv",], tot~class, mean)
