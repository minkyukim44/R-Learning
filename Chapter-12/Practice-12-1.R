## Interactive graphs - plotly

# prepare packages
install.packages("plotly")
library(plotly)

# plot a graph
library(ggplot2)
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
ggplotly(p)

p1 <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + geom_bar(position = "dodge")
ggplotly(p1)
