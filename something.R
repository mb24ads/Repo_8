x1 <- rnorm(50)
x2 <- rnorm(30, mean=0.2)
x3 <- rnorm(100,mean=0.1)
x4 <- rnorm(100,mean=0.4)

x <- data.frame(data=c(x1,x2,x3,x4),
                key=c(
                  rep("x1", length(x1)),
                  rep("x2", length(x2)),
                  rep("x3", length(x3)),
                  rep("x4", length(x4))) )

pairwise.t.test(x$data,
                x$key,
                pool.sd=FALSE)