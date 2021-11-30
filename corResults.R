corrResults<-c()
for (v in 1:300)
{
  x<-runif(300,min=1,max=5)
  y<-runif(300,min=1,max=5)
  corrResults<-append(corrResults,cor(x,y))
}
hist(corrResults)
print(max(corrResults))
