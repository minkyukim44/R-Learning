## Text Mining
# pre-setting
install.packages("rJava")
install.packages("memoise")
install.packages("dplyr")
install.packages('devtools')
devtools::install_github('haven-jeon/KoNLP', 
                         dependencies = TRUE, 
                         INSTALL_opts = c('--no-lock', '--no-multiarch'))       # set only install for 64bit

install_version("backports", version = "1.1.8")                             

Sys.setenv(JAVA_HOME = "C:\\Program Files\\Java\\jdk-14.0.2")
Sys.getenv("PATH")

library(rJava)
library(KoNLP)
library(dplyr)

# load textfile
txt <- readLines("hiphop.txt")

useNIADic()
head(txt)

# remove special characters
install.packages("stringr")
library(stringr)

txt <- str_replace_all(txt,"\\W", " ")

# extract nouns
extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")
nouns <- extractNoun(txt)
wordcount <- table(unlist(nouns))
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
df_word <- rename(df_word, word = Var1,
                  freq = Freq)
df_word <- filter(df_word, nchar(word) >= 2)
top_20 <- df_word %>% 
    arrange(desc(freq)) %>% 
    head(20)
top_20

# make a word cloud
install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)

pal <- brewer.pal(8, "Dark2")       # generate a list of colors
set.seed(1234)                      # fix random numbers

wordcloud(words = df_word$word,     # works
          freq = df_word$freq,      # frequency
          min.freq = 2,             # minimum frequency of words
          max.words = 200,          # the number of words
          random.order = F,         # show the word of the high frequency at the center
          rot.per = .1,             # rotate words 
          scale = c(4, 0.3),        # the range of the word size
          colors = pal)             # color

# change colors
pal1 <- brewer.pal(9, "Blues")[5:9]
set.seed(1234)

wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal1)
