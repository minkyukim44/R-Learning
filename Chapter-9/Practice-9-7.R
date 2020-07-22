## Job vs sex
# Top 10 male's job
job_male <- welfare %>% 
    filter(!is.na(job) & sex == "male") %>% 
    group_by(job) %>% 
    summarise(n = n()) %>% 
    arrange(desc(n)) %>% 
    head(10)
job_male

# Top 10 female's job
job_female <- welfare %>% 
    filter(!is.na(job) & sex == "female") %>% 
    group_by(job) %>% 
    summarise(n = n()) %>% 
    arrange(desc(n)) %>% 
    head(10)
job_female

# Plotting
ggplot(data = job_male, aes(x = reorder(job, n), y = n)) + 
    geom_col() + 
    coord_flip()

ggplot(data = job_female, aes(x = reorder(job, n), y = n)) +
    geom_col() + 
    coord_flip()
