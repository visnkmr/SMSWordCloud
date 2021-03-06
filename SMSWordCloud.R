TestData <- read.csv(file="C:/Users/vishmegh/Desktop/new_inbox_sms.csv", header=TRUE, sep=",")
install.packages("tm")
appcount<-aggregate(TestData,by = list(TestData$body,TestData$address),FUN = length)[,1:3]
library(tm)
corpus = VCorpus(VectorSource(TestData$body))
corpus = tm_map(corpus, content_transformer(tolower))
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, stopwords("english"))
dtm = DocumentTermMatrix(corpus)
allTweets = as.data.frame(as.matrix(dtm))
library(wordcloud)
wordcloud(colnames(allTweets), colSums(allTweets))
