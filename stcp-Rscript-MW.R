#    MANN WHITNEY in R SCRIPT FILE.
#    www_statstutor_ac_uk Community Project.
#    Sofia Maria Karadimitriou and Ellen Marshall, Sheffield University.
#    Reviewed by Basile Marquier, University of Sheffield.
#    Dataset: Ulcer csv.
#    Resource: MANN WHITNEY in R.


#Open the leg ulcer comparison dataset which is saved as a csv file and call it ulcerR.  
#If your file is saved as a standard Excel file, save it as a csv file first.  
#You will need to change the command depending on where you have saved the file.

#Download the data set in .csv format and put it in a directory on your computer
ulcerR<-read.csv("stcp-Rdataset-LegUlcer.csv",header=T,sep=",") 
#Tell R we are using the leg ulcer dataset until further notice using attach.
#This means that 'GROUP' can be used instead of ulcerR$GROUP.
attach(ulcerR)


#R assumes all numeric values are continuous so tell it that ?GROUP? is a factor. 
#and attach labels to the categories (for example 1 in group means the individual was at clinic).
# The factor command uses variable<-factor(variable,c(category numbers),labels=c(category names)).
GROUP<-factor(GROUP,c(1,2),labels=c('Clinic','Home'))
attach(ulcerR)




#calculate medians and standard deviations for each group.
#na.rm=T removes rows that missing values exist.
medians<-tapply(UFW,GROUP,median,na.rm=T)
iqrs<-tapply(UFW,GROUP,IQR,na.rm=T)
#Combine in one table and give rownames.
results1<-cbind(medians,iqrs)
#Round all the summary statistics to 2 decimal places.
round(results1,2)
#To calculate the difference between the medians.
round(medians[1]-medians[2],2)
#Checking assumptions.
#The shape of the distributions of the dependent variable by group must be similar
#This can be checked using histograms
#Specify that two charts are needed next to each other.
par(mfrow=c(1,2))
#Plot histogram for the UFW of individuals in clinic group
hist(UFW[GROUP=='Clinic'],main='Histogram for Clinic',xlab='Leg Ulcer free time')
#Plot histogram for the for UFW of individuals at home
hist(UFW[GROUP=='Home'],main='Histogram for Home',xlab='Leg Ulcer free time')




#Carry out the Mann Whitney Test.
#use wilcox.test command. By default it conducts the Mann Whitney U Test. 
wilcox.test(UFW~GROUP) 
#If the test is significant, there is a difference between medians.
#Finish by reporting what that difference is. 


#Moods Test in R
#Constructing the method
#Calculates a pooled median from all the data 
#then use a Chi-squared test to compare each group?s proportions below the pooled median.  
median.test <- function(x, y){
    z <- c(x, y)
    g <- rep(1:2, c(length(x), length(y)))
    m <- median(z)
    fisher.test(z < m, g)$p.value
}
median.test <- function(GROUP,UFW){
    z <- c(GROUP,UFW)
    g <- rep(1:2, c(length(x), length(y)))
    m <- median(z)
    fisher.test(z < m, g)$p.value
}

#Example of using it
median.test(UFW[GROUP=='Clinic'], UFW[GROUP=='Home'])



