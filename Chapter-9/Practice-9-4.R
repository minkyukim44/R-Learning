## Age Group vs Income
# Make a derived variable "ageg"
welfare <- welfare %>% 
    mutate(ageg = ifelse(age < 30, "young", 
                         ifelse(age <= 59, "middle", "old")))
table(welfare$ageg)
qplot(welfare$ageg)

# Plot Mean Income vs Age Group
ageg_income <- welfare %>% 
    filter(!is.na(income)) %>% 
    group_by(ageg) %>% 
    summarise(mean_income = mean(income))
ageg_income
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) +
    geom_col() +
    scale_x_discrete(limit = c("young", "middle", "old"))       # change the order of x-axis 

