## Income vs Age
# Check 'birth' variable
class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)

# Pre-processing
table(is.na(welfare$birth))

# Make a derived variable about "age"
welfare$age <- 2015 - welfare$birth + 1
summary(welfare$age)
qplot(welfare$age)

# Plot mean_income vs age
age_income <- welfare %>% 
    filter(!is.na(income)) %>% 
    group_by(age) %>% 
    summarise(mean_income = mean(income))
head(age_income)
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()
