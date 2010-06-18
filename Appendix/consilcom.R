#Author: Mauricio Esguerra
#Date:   June 18, 2010
#Example to show the meaning of validation scores
#and their relationship to the concepts of
#conectedness, compactness, and separation.
library(clValid)
x <- c(1.0, 2.0, 1.5, 4.0, 4.0, 4.0, 7.5, 7.5, 8.0)
y <- c(1.0, 1.0, 2.0, 0.5, 1.5, 2.0, 1.0, 1.5, 1.5)
alldata <- cbind(x,y)
scaled <- scale(alldata)
plot(x,y,xlim=c(0,10),ylim=c(0,10))

intern <- clValid(scaled,2:5,clMethods=c("pam", 
                                "hierarchical", "diana"),
                  validation = "internal")
summary(intern)


stability <- clValid(scaled,2:5,clMethods=c("pam", "som",
                                   "hierarchical", "diana"),
                     validation = "stability")
summary(stability)

postscript("val_int.ps")
op <- par(no.readonly=TRUE)
par(mfrow = c(2,2), mar=c(4,4,3,1))
plot(intern, legend=FALSE)
plot(nClusters(intern), measures(intern, "Dunn")[, , 1], type="n",
     axes=F, xlab="", ylab="")
legend("center", clusterMethods(intern), col = 1:4, lty = 1:4,
       pch = paste(1:4))
par(op)
dev.off()

postscript("val_sta.ps")
op <- par(no.readonly=TRUE)
par(mfrow = c(2,2), mar=c(4,4,3,1))
plot(stability, measure=c("APN", "AD", "ADM"), legend=FALSE)
plot(nClusters(stability), measures(stability, "APN")[, , 1], type="n",
     axes=F, xlab="", ylab="")
legend("center", clusterMethods(stability), col = 1:4, lty = 1:4,
       pch = paste(1:4))
par(op)
dev.off()
