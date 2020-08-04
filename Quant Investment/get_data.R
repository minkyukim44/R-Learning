# getting data from Quadl.com API
url.aapl = "http://www.quandl.com/api/v3/datasets/WIKI/AAPL/data.csv?api_key=xw3NU3xLUZ7vZgrz5QnG"
data.aapl = read.csv(url.aapl)
head(data.aapl)

# getting data from Yahoo finance
install.packages("quantmod")
library(quantmod)

getSymbols('AAPL')
head(AAPL)

chart_Series(Ad(AAPL))      # for American stocks, use adjusted values

data = getSymbols('AAPL',
                  from = '2000-01-01', to = '2020-08-31',
                  auto.assign = FALSE)
head(data)
chart_Series(Ad(data))

ticker = c('FB', 'NVDA')
getSymbols(ticker)
head(FB)
head(NVDA)

getSymbols('TSLA')
head(TSLA)
chart_Series(Ad(TSLA))

# getting Korean stock market data
getSymbols('005930.KS',
           from = '2000-01-01', to = '2018-12-31')
tail(Ad(`005930.KS`))
tail(Cl(`005930.KS`))       # for Korean stocks, use closing values
chart_Series(Cl(`005930.KS`))

getSymbols("068760.KQ",
           from = '2000-01-01', to = '2018-01-31')
tail(Cl(`068760.KQ`))

# getting FRED data
getSymbols('DGS10', src='FRED')
chart_Series(DGS10)

getSymbols('DEXKOUS', src='FRED')
tail(DEXKOUS)

