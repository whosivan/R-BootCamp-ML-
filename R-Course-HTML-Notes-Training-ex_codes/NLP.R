library(twitterR)
library(tm)
library(wordcloud)
library(RColorBrewer)

#CONNECT TO TWITTER
setup_twitter_oauth(ckey, skey, token, sectoken)

##
soccer.tweets <- searchTwitter('soccer', n = 1000, lang = 'en')
##Grabbing Text Data from Tweets
soccer.text <- sapply(soccer.tweets, function(x), x$getText())

####
#clean text data
###
soccer.text <- iconv(soccer.text, 'UTF-8', 'ASCII')
##
soccer.corpus <- Corpus(VectorSource(soccer.text))
##
#Document term matrix
##
term.doc.matrix <- TermDocumentMatrix(soccer.corpus, 
                                      control = list(removePunctuation = TRUE,
                                                     stopwords = c('soccer', stopwords('english')),
                                                     removeNumber = TRUE,
                                                     tolower = TRUE))

## 
#convert object into a matrix
term.doc.matrix <- as.matrix(term.doc.matrix)

#get word counts
word.freq <- sort(rowSums(term.doc.matrix), decreasing = TRUE)
dm <- data.frame(word = names(word.freq), freq = word.freq)

#Create wordcloud
wordcloud(dm$word, dm$freq, random.order = FALSE, colors = brewer.pal(8, 'Dark2 '))