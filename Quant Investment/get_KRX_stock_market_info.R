## getting stock market info from KRX
library(httr)
library(rvest)

Sys.setlocale("LC_ALL", "English")  # set language in English 

url = 'https://kind.krx.co.kr/disclosure/todaydisclosure.do'
data = POST(url, body =
                list(
                    method = 'searchTodayDisclosureSub',
                    currentPageSize = '100',
                    pageIndex = '1',
                    orderMode = '0',
                    orderStat = 'D',
                    forward = 'todaydisclosure_sub',
                    chose = 'S',
                    todayFlag = 'Y',
                    selDate = '2018-12-28'
                ))

data = read_html(data) %>% 
    html_table(fill = TRUE) %>% 
    .[[1]]

Sys.setlocale("LC_ALL", "Korean")

print(head(data))
View(data)
