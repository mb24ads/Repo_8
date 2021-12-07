library(tidyverse)
dfDiet <- read_csv("stcp-Rdataset-Diet.csv")
dfDiet$weightChange<-dfDiet$pre.weight-dfDiet$weight6weeks
dietDf2<-spread(dfDiet,Diet,weightChange)
names(dietDf2)[7]<-"Diet1"
names(dietDf2)[8]<-"Diet2"
names(dietDf2)[9]<-"Diet3"
boxplot(dietDf2[,c(7:9)])
summary(dietDf2[,c(7:9)])
hist(dietDf2$Diet1)
hist(dietDf2$Diet2, breaks=20)
hist(dietDf2$Diet3, breaks=20)
dietDf2_3<-subset(dfDiet, Diet>1)
wilcox.test(weightChange~Diet,data=dietDf2_3)
t.test(weightChange ~ Diet, data = dfDiet)$p.value
