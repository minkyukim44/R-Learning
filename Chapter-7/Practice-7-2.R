## Remove outliers

outlier <- data.frame(sex = c(1,2,1,3,2,1),
                      score = c(5,4,3,4,2,6))
table(outlier$sex)
table(outlier$score)

outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)

outlier %>% 
    filter(!is.na(sex) & !is.na(score)) %>% 
    group_by(sex) %>% 
    summarise(mean_score = mean(score))

mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats      # [1,]: lower extrema boundary, [2,]: first quarter, [3,]: median, [4,]: third quarter, [5,] upper exterma boundary

mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)     # assign NA if 
table(is.na(mpg$hwy))

mpg %>% 
    group_by(drv) %>% 
    summarise(mean_hwy = mean(hwy, na.rm = T))
