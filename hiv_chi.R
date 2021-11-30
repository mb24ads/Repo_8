library(tidyverse)
dt <- read_csv("hiv_test_acceptance.csv")
#getting rid of the totals row
dt<-dt[-5,]
#convert to data frame (makes renaming rows easier)
dt<-as.data.frame(dt)
#changing the first column into row names
row.names(dt)<-dt$Status
#removing first column
dt<-dt[,-1]
#adding a new column which converts raw numbers into percentages of acceptances
dt$percentAccepted=dt$Accepted*100/(dt$Accepted+dt$Rejected)
#calculating percentages of rejections
dt$percentRejected=100-dt$percentAccepted
#now renaming the columns to make it easier to plot
names(dt)[3]<-"% Accepted"
names(dt)[4]<-"% Rejected"
#now doing a transpose to make the categories into columns and the accept/reject into rows
dta<-t(dt)
#now keeping only the percentage columns
dta<-dta[3:4,]

#below some of my first attempts at plotting


#barplot(dta,col=c("Cyan","Magenta"),legend = TRUE)


#barplot(dta,col=c("Cyan","Magenta"),legend = TRUE,ylim=c(0,140))

#barplot(dta, col = terrain.colors(6), ylim = c(0, 120), 
#        legend = TRUE, 
#       args.legend = list(bty = "n", x = "top", ncol = 2)
#        )

#but here is the best plot I managed to do for now


barplot(dta,col=c("Cyan","Magenta"),legend = TRUE, xlim = c(0, 7),ylab="Percentage",
        main="Decision to Accept HIV Test factored by Relationship Status", cex.names=0.5)

chisq.test(dta)


