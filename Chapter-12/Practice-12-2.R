## Interactive graphs - dygraph

# prepare a package
install.packages("dygraphs")
library(dygraphs)

# prepare a dataset
economics <- ggplot2::economics
head(economics)

library(xts)
eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)

dygraph(eco)

dygraph(eco) %>% dyRangeSelector()      # select a range of dates

# plot various graphs
eco_a <- xts(economics$psavert, order.by = economics$date)
eco_b <- xts(economics$unemploy/1000, order.by = economics$date)
eco2 <- cbind(eco_a, eco_b)
head(eco2)
colnames(eco2) <- c("psavert", "unemploy")
head(eco2)

dygraph(eco2) %>% dyRangeSelector()
