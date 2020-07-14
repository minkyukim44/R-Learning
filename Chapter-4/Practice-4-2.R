## Using External Dataset
# Import an Excel File

install.packages("readxl")
library(readxl)

getwd()     # Check Path
setwd("C:/User/user/Desktop/Programming/R-programming")     # Set Path

df_exam <- read_excel("C:/Users/user/Desktop/Programming/R-programming/Chapter-4/excel_exam.xlsx")  #Import the Excel File
df_exam

mean(df_exam$english)   # Mean of English Scores
mean(df_exam$science)   # Mean of Science Scores

# If First Line is not Variables?
df_exam_novar <- read_excel("C:/Users/user/Desktop/Programming/R-programming/Chapter-4/excel_exam_novar.xlsx", col_names = F) 
df_exam_novar

mean(df_exam_novar$...1)

# If there are multiple sheets
df_exam_sheet <- read_excel("C:/Users/user/Desktop/Programming/R-programming/Chapter-4/excel_exam_sheet.xlsx", sheet = 3) 
df_exam_sheet

# Import CSV Files
df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam

# Write CSV Files
df_midterm <- data.frame(english = c(90, 80, 60, 70), 
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm

write.csv(df_midterm, file = "df_midterm.csv")

#RData File
save(df_midterm, file="df_midterm.rda") # Save df_midterm as df_midterm.rda

rm(df_midterm)                          # Remove df_midterm
df_midterm

load("df_midterm.rda")                  # Load df_midterm from df_midterm.rda
df_midterm
