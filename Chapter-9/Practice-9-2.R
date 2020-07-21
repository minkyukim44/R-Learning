## Income difference 
class(welfare$sex)
table(welfare$sex)

# Check missing values
table(is.na(welfare$sex))

# Assign names
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)
qplot(welfare$sex)

# Check the income variable
class(welfare$income)
summary(welfare$income)
qplot(welfare$income)
qplot(welfare$income) + xlim(0, 1000)

# Pre-processing
welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)
table(is.na(welfare$income))

# Mean Income vs Sex
sex_income <- welfare %>% 
    filter(!is.na(income)) %>% 
    group_by(sex) %>% 
    summarise(mean_income = mean(income))
options(pillar.sigfig = 7)      # change the number of displayed digits in tribbles
sex_income
ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()
