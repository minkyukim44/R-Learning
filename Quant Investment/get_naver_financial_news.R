## naver financial news crawling
install.packages("rvest")
install.packages("httr")

library(rvest)
library(httr)
library(stringr)

url = paste0('https://finance.naver.com/news/news_list.nhn?mode=LSS2D&section_id=101&section_id2=258')
data = GET(url)
print(data)

data_title = data %>% 
    read_html(encoding = 'EUC-KR') %>% 
    html_nodes('dl') %>% 
    html_nodes('.articleSubject') %>% 
    html_nodes('a') %>% 
    html_attr('title')
print(data_title)

data_summary = data %>% 
    read_html(encoding = 'EUC-KR') %>% 
    html_nodes('dl') %>% 
    html_nodes('.articleSummary') %>% 
    html_text()
data_summary <- str_replace_all(data_summary, "[\r\n\t]", "")
print(data_summary)
write.csv(data_summary, file = "data_summary")
