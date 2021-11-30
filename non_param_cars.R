library(tidyverse)
hist(mtcars$mpg)

newdf<-aggregate(mtcars$mpg, by=list(mtcars$am),FUN=median, na.rm=TRUE)
View(newdf)

mtcarsmpggears<-mtcars[,c("am","mpg")]


mtcarsmpggears<- mtcarsmpggears %>% rownames_to_column("Car_Brand")
hist(mtcarsmpggears$mpg)

q<-spread(mtcarsmpggears,am,mpg)
names(q)[2]<-"Manual"
names(q)[3]<-"Automatic"

q$Manual<-as.numeric(q$Manual)
q$Automatic -as.numeric(q$Automatic)

hist(q$Manual)
hist(q$Automatic)


boxplot(q$Manual,q$Automatic)

summary(q)

wilcox.test(mpg ~ am, data=mtcars)
