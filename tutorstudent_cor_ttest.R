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
#we can reject the null hypothesis that the correlation found was an effect of chance

cor(dfTsc$Student,dfTsc$Tutor,use="pairwise.complete.obs", method="pearson")
plot(dfTsc$Student,dfTsc$Tutor)

cor.test(dfTsc$Student,dfTsc$Tutor,method="pearson")

#we can reject null hypothesis that the difference in means was an effect of chance
t.test(dfTsc$Student,dfTsc$Tutor,paired=TRUE)



