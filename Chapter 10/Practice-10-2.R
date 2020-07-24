## Twitter text mining
# load data
twitter <- read.csv("twitter.csv",
                    header = T,
                    stringsAsFactors = F,
                    fileEncoding = "UTF-8")

# rename variables
twitter <- rename(twitter,
                  no = 번호,
                  id = 계정이름,
                  date = 작성일,
                  tw = 내용)

# remove special characters
twitter$tw <- str_replace_all(twitter$tw, "\\W", " ")
head(twitter$tw)

# make a frequency table
nouns <- extractNoun(twitter$tw)
wordcount <- table(unlist(nouns))
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)
df_word <- filter(df_word, nchar(word) >= 2)
top20 <- df_word %>% 
    arrange(desc(freq)) %>% 
    head(20)
top20

# make a frequency bar graph
library(ggplot2)

order <- arrange(top20, freq)$word      # generate a variable of the frequency order

ggplot(data = top20, aes(x = word, y = freq)) +
    ylim(0, 2500) + 
    geom_col() + 
    coord_flip() +
    scale_x_discrete(limit = order) +
    geom_text(aes(label = freq), hjust = -0.3)

# make a word cloud
pal2 <- brewer.pal(8, "Dark2")
set.seed(1234)

wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 50,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(5, 0.45),
          colors = pal2)

pal3 <- brewer.pal(9, "Blues")[5:9]
set.seed(1234)

wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 50,
          max.word = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.4),
          colors = pal3)
