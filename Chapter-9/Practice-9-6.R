## Income vs Job
library(dplyr)
library(ggplot2)
library(foreign)
library(readxl)

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", to.data.frame = T)

welfare <- raw_welfare
welfare <- rename(welfare, 
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)

class(welfare$code_job)
table(welfare$code_job)

# Pre-processing
list_job <- read_excel("Koweps_Codebook.xlsx", col_names = T, sheet = 2)
head(list_job)
dim(list_job)

# Left-joining
welfare <- left_join(welfare, list_job, id = "code_job")
welfare %>% 
    filter(!is.na(code_job)) %>% 
    select(code_job, job) %>% 
    head(10)
View(welfare)

# Make a mean income chart
job_income <- welfare %>% 
    filter(!is.na(job) & !is.na(income)) %>% 
    group_by(job) %>% 
    summarise(mean_income = mean(income))
options(pillar.sigfig = 7)
head(job_income)

top10 <- job_income %>% 
    arrange(desc(mean_income)) %>% 
    head(10)
top10

bottom10 <- job_income %>% 
    arrange(mean_income) %>% 
    head(10)
bottom10

# Plotting
ggplot(data = top10, aes(x = reorder(job, mean_income), y = mean_income)) + 
    geom_col() +
    coord_flip()

ggplot(data = bottom10, aes(x = reorder(job, -mean_income), y = mean_income)) + 
    geom_col() +
    coord_flip() + 
    ylim(0, 850)
