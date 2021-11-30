fball <- read_csv("fball.csv")
hist(fball$Assets)
hist(fball$Pts)
cor.test(fball$Assets,fball$Pts,method="spearman")
