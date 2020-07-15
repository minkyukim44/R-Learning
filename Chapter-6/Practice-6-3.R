## practice summarise() & group_by()

exam <- read.csv("csv_exam.csv")

exam %>% summarise(mean_math = mean(math))  # mean of math

exam %>% 
    group_by(class) %>% 
    summarise(mean_math = mean(math))  # mean of math for each class

exam %>% 
    group_by(class) %>% 
    summarise(mean_math = mean(math),
              sum_math = sum(math),
              median_math = median(math),
              n = n())  # frequency

mpg <- as.data.frame(ggplot2::mpg)

mpg %>% 
    group_by(manufacturer, drv) %>% 
    summarise(mean_cty = mean(cty)) %>% 
    head(10)

mpg %>% 
    group_by(manufacturer) %>% 
    filter(class == "suv") %>% 
    mutate(total = cty + hwy) %>% 
    summarise(mean_total = mean(total)) %>% 
    arrange(desc(mean_total)) %>% 
    head(5)

## practice combining 
# horizontal joining
test1 <- data.frame(id = c(1,2,3,4,5),
                    midterm = c(60,80,70,90,85))
test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(70,83,65,95,80))
total <- left_join(test1, test2, by = "id")     # with respect to "id", left-joining test1 and test2
total

name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c("kim","lee","park","choi","jung"))
exam_new <- left_join(exam, name, by = "class")
exam_new

# vertical joining
group_a <- data.frame(id = c(1,2,3,4,5),
                      test = c(60,80,70,90,85))
group_b <- data.frame(id = c(6,7,8,9,10),
                      test = c(70,83,65,95,80))
group_all <- bind_rows(group_a, group_b)
group_all
