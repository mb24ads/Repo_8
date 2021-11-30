library(tidyverse)
ccdrd<- read_csv("cleaned_custodial_death_reports_databse.csv")
dtrg<-spread(ccdrd,race,sex)
dtrg<-dtrg[,52:55]
ct<-sapply(dtrg,FUN=table)
chisq.test(ct)
