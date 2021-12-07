#library(tidyverse)
#mtcars_numbers <- dplyr::select_if(mtcars, is.numeric) # simulate some data like you describe
# all_pairs <- combn(names(mtcars_numbers), 2, simplify = T)
# all_pairs
# q<-lapply(all_pairs,
#        function(x) {
#          t.test(mtcars[[x[1]]], mtcars[[x[2]]],paired=FALSE)
#        })
# 
# dfResults<-NULL
# 
# 
# 
# df1 <- data.frame(x1=character(),x2=numeric(),x3 = numeric(),x4=numeric(),
#                     stringsAsFactors = FALSE)

aggregate(mtcars$mpg~mtcars$cyl,FUN=mean)
pairwise.t.test(mtcars$mpg,mtcars$cyl)


# for (i in 1:length(all_pairs)) {
#   caption<-paste(as.vector(all_pairs[,i]),collapse=" vs ")
#   tvalue<-q[[i]]$statistic
#   pvalue<-q[[i]]$p.value
#   mvalue<-q[[i]]$estimate
#   df1[i,]<-list(caption,tvalue,pvalue,mvalue)
# }
