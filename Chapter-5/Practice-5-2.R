## Change a name of a variable

df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 2))
df_raw

install.packages("dplyr")   # "dplyr" for manipulating data 
install.packages("glue")
library(dplyr)

df_new <- df_raw
df_new

df_new <- rename(df_new, v2 = var2) # rename var2 to v2
df_new