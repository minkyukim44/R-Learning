# Questions
# Q-6-2

mpg <- as.data.frame(ggplot2::mpg)

displ_4 <- mpg %>% filter(mpg$displ <= 4)
displ_5 <- mpg %>% filter(mpg$displ >= 5)

mean(displ_4$hwy)
mean(displ_5$hwy)

man_audi <- mpg %>% filter(mpg$manufacturer == "audi")
man_toyota <- mpg %>% filter(mpg$manufacturer == "toyota")

mean(man_audi$cty)
mean(man_toyota$cty)

manu_cars <- mpg %>% filter(mpg$manufacturer %in% c("chevrolet", "ford" , "honda"))
mean(manu_cars$hwy)

# Q-6-3

mpg <- as.data.frame(ggplot2::mpg)

mpg %>% select(class,cty)

selection_suv <- mpg %>% filter(class == "suv") %>% select(cty)
mean(selection_suv$cty)
selection_compact <- mpg %>% filter(class == "compact") %>% select(cty)
mean(selection_compact$cty)

# Q-6-4

mpg <- as.data.frame(ggplot2::mpg)
?mpg

selection_audi <- mpg %>% 
                        filter(manufacturer == "audi") %>% 
                        select(hwy) %>% arrange(desc(hwy)) %>% 
                        head(5)
selection_audi

# Q-6-5

mpg_copy <- mpg
mpg_copy <- mpg_copy %>% mutate(total = cty + hwy) 
mpg_copy <- mpg_copy %>% mutate(mean = total/2) 
mpg_copy <- mpg_copy %>% arrange(desc(mean)) %>% head(3)
mpg_copy

mpg_copy <- mpg %>% mutate(total = cty + hwy, mean = (cty+hwy)/2) %>% arrange(desc(mean)) %>% head(3) 
mpg_copy

# Q-6-6

mpg <- as.data.frame(ggplot2::mpg)

mpg %>% 
        group_by(class) %>% 
        summarise(mean_total = mean(cty)) %>% 
        arrange(desc(mean_total)) 
        
mpg %>% 
    group_by(manufacturer) %>%
    summarise(mean_total = mean(hwy)) %>% 
    arrange(desc(mean_total)) %>% 
    head(3)

mpg %>% 
    group_by(manufacturer) %>% 
    filter(class == "compact") %>% 
    summarise(n = n()) %>% 
    arrange(desc(n))
    
# Q-6-7
fuel <- data.frame(fl = c("c","d","e","p","r"),
                   price_fl = c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F)    # keep a string as a character instead of a factor

mpg <- as.data.frame(ggplot2::mpg)
mpg
fuel

mpg_new <- left_join(mpg, fuel, by = "fl")
mpg_new

mpg_new %>% 
    select(model, fl, price_fl) %>%
    head(5)

# Q-6-last

library(dplyr)
?dplyr

midwest <- as.data.frame(ggplot2::midwest)

midwest_new <- midwest

midwest_new <- midwest_new %>% 
               mutate(adult_ratio = popadults/poptotal*100,
                      adult_size = ifelse(adult_ratio >= 40, "large", ifelse(adult_ratio >= 30, "middle", "small"))) %>% 
               arrange(desc(adult_ratio))
View(midwest_new)

midwest_new %>% 
            group_by(adult_size) %>% 
            summarise(n = n())

midwest_asian <- 
            midwest_new %>% 
                mutate(asian_ratio = popasian/poptotal*100) %>% 
                arrange(asian_ratio) %>% 
                select(state,county,asian_ratio) %>% 
                head(10)
View(midwest_asian)
