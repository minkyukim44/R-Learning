## Visualization of Maps

# install a package for choropleth maps
install.packages("ggiraphExtra")
library(ggiraphExtra)

# load a built-in dataset
str(USArrests)
head(USArrests)

# change column_names to variables
library(tibble)

crime <- rownames_to_column(USArrests, var = "state")   # change columns to variables
crime$state <- tolower(crime$state)                     # change to lower case letters

str(crime)

# prepare a map
library(ggplot2)
install.packages("maps")
install.packages("mapproj")
states_map <- map_data("state")
str(states_map)

# make choropleths
ggChoropleth(data = crime, aes(fill = Murder, map_id = state), map = states_map)
ggChoropleth(data = crime, aes(fill = Murder, map_id = state), map = states_map, interactive = T)

