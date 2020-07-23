## Age vs region
# Re-setting

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

# checking
class(welfare$code_region)
table(welfare$code_region)

# assigning
list_region <- data.frame(code_region = c(1:7),
                          region = c("Seoul", "Incheon/Gyungggi", "Busan/Kyungnam/Ulsan", "Daegu/Kyungbuk", "Daejeon/Choongnam",
                                     "Gangwon/Choongbuk", "Gwangju/Jeonra/Jeju"))
list_region

# joining
welfare <- left_join(welfare, list_region, id = "code_region")
welfare %>% 
    select(code_region, region) %>% 
    head(10)

# charting
region_ageg <- welfare %>% 
    group_by(region, ageg) %>% 
    summarise(n = n()) %>%
    mutate(tot_group = sum(n)) %>% 
    mutate(pct = round(n/tot_group*100, 2))
head(region_ageg)

region_ageg <- welfare %>% 
    count(region, ageg) %>% 
    group_by(region) %>% 
    mutate(pct = round(n/sum(n)*100, 2))
head(region_ageg)

# graphing
ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) + geom_col() + coord_flip()

list_order_old <- region_ageg %>% 
    filter(ageg == "old") %>% 
    arrange(pct)
list_order_old

order <- list_order_old$region
order

ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) + 
    geom_col() + 
    coord_flip() + 
    scale_x_discrete(limits = order)

# assigining order
class(region_ageg$ageg)
levels(region_ageg$ageg)
region_ageg$ageg <- factor(region_ageg$ageg, 
                           level = c("old", "middle", "young"))
class(region_ageg$ageg)
levels(region_ageg$ageg)

ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) + 
    geom_col() + 
    coord_flip() + 
    scale_x_discrete(limits = order)
