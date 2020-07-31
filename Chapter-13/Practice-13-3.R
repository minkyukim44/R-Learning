## cor.test

# compare two variables
library(ggplot2)
economics <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)

# compare multiple variables
head(mtcars)
car_cor <- cor(mtcars)  # generate a correlation matrix
round(car_cor, 2)       # round at the third digit

install.packages("corrplot")
library(corrplot)
corrplot(car_cor)
corrplot(car_cor, method = "number")

col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))

corrplot(car_cor,
         method = "color",          # diplay in coloring
         col = col(200),            # select 200 colors
         type = "lower",            # diplay only the bottom left part of the matrix 
         order = "hclust",          # group similar correlational coeffecients
         addCoef.col = "black",     # choose a color of correlation coefficients
         tl.col = "black",          # choose a color of variable names
         tl.srt = 45,               # choose a slope of the variable names
         diag = F)                  # exclude a diagonal part of the matrix
