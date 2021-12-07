#pairwise means of normal data

aggregate(mtcars$mpg~mtcars$cyl,FUN=mean)
pairwise.t.test(mtcars$mpg,mtcars$cyl)


#pairwise medians non normal data

library(tidyverse)
dfDiet <- read_csv("stcp-Rdataset-Diet.csv")
dfDiet$weightChange<-dfDiet$pre.weight-dfDiet$weight6weeks

aggregate(dfDiet$weightChange~dfDiet$Diet,FUN=median)
pairwise.wilcox.test(dfDiet$weightChange,dfDiet$Diet)
