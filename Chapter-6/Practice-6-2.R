## Practice select()

library(dplyr)

exam <- read.csv("csv_exam.csv")

exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)

exam %>% select(-math)      # exclude "math" column
exam %>% select(-math,-science)

exam %>% 
    filter(class == 1) %>% 
    select(english)

exam %>% 
    select(id, math) %>% 
    head                    # show the first six rows


exam %>% 
    select(id, math) %>% 
    head(10)                # show the first ten rows

## practice arrange()

exam %>% arrange(math)          # ascending
exam %>% arrange(desc(math))    # decending

exam %>% arrange(class,math)

## add up derived variables

exam %>% 
    mutate(total = math + english + science) %>%        # adding "total" in the table
    head

exam %>% 
    mutate(total = math + english + science, 
          mean = (math + english + science)/3) %>% 
    head

exam %>% 
    mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
    head

exam %>% 
    mutate(total = math + english + science) %>%
    arrange(total) %>% 
    head
