## Removing missing values

library(dplyr)

df <- data.frame(sex = c("M","F",NA,"M","F"),
                 score = c(5,4,3,4,NA))     # no "" for NA

is.na(df)           # check missing values

table(is.na(df))    # check a frequency of missing values

table(is.na(df$sex))
table(is.na(df$score))

mean(df$sex)
mean(df$score)

df %>% filter(is.na(score))         # show score w/ missing data 
df %>% filter(!is.na(score))        # show score w/ missing data

df_nomiss <- df %>% filter(!is.na(score))  
mean(df_nomiss$score)
sum(df_nomiss$score)

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))     # remove all missing data
df_nomiss

df_nomiss2 <- na.omit(df)       # remove all missing data
df_nomiss2

mean(df$score, na.rm = T)       # compute after removing missing data in "score"
sum(df$score, na.rm = T)

exam <- read.csv("csv_exam.csv")
exam[c(3,8,15), "math"] <- NA
exam

exam %>% summarise(mean_math = mean(math, na.rm = T),
                   sum_math = sum(math, na.rm = T),
                   median = median(math, na.rm = T))
                   
mean(exam$math, na.rm = T)       # compute w/o missing data

exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))

exam

mean(exam$math)
