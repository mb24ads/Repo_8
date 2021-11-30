library(tidyverse)
tutor_student_correlations <- read_csv("tutor_student_correlations.csv", col_names = FALSE)
dfTsc<-as.data.frame(t(tutor_student_correlations))
dfTsc<-dfTsc[-1,]
names(dfTsc)[1] <- "Student"
names(dfTsc)[2] <- "Tutor"
dfTsc$Student<-as.numeric(dfTsc$Student)
dfTsc$Tutor<-as.numeric(dfTsc$Tutor)
summary(dfTsc)
boxplot(dfTsc)
t.test(dfTsc$Student,dfTsc$Tutor,paired=TRUE)
###now with really small sample  (which shows that not enough records)
dfsmall<-dfTsc[1:5,]
t.test(dfsmall$Student,dfsmall$Tutor,paired=TRUE)
