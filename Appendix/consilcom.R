#Author: Mauricio Esguerra
#Date:   June 18, 2010
#Example to show the meaning of validation scores
#and their relationship to the concepts of
#conectedness, compactness, and separation.
library(clValid)

#################################################################
# Function for normalization of base-step vectors
# This function must normalize columnwise in order to
# work
#################################################################
normcol <- function(x,y,...)
{
norm <- (x - min(x))/(max(x) - min(x))
norm
}
#################################################################

x <- c(1.8, 2.0, 1.9, 2.5, 2.5, 2.5, 3.5, 3.5, 3.6, 3.7, 3.8)
y <- c(1.65, 1.65, 1.7, 1.80, 1.82, 1.84, 1.45, 1.5, 1.4, 1.4, 1.5)
alldata <- cbind(x,y)
scaled <- scale(alldata)
normal <- cbind(normcol(x),normcol(y))
#plot(x,y,xlim=c(0,10),ylim=c(0,10), pch=21)
png(filename="comconsep.png", width=600, height=600)
plot(normal[,1],normal[,2], pch=21, xlab="x", ylab="y")

points(normal, pch=21, bg="red", col="blue")
text(normal[,1], normal[,2], cex=1.0, pos=4, col="blue") 
dev.off()


intern <- clValid(normal, 2:8, neighbSize=3, metric="euclidean",
                  clMethods=c("pam", "kmeans", "model",
                               "sota", "hierarchical", "diana"),
                  validation = "internal")
summary(intern)

#set.seed(3)
stability <- clValid(normal,2:8,clMethods=c("pam", "som",
                                   "hierarchical", "diana"),
                     validation = "stability")
summary(stability)

#postscript("val_int.ps")
op <- par(no.readonly=TRUE)
par(mfrow = c(2,2), mar=c(4,4,3,1))
plot(intern, legend=FALSE)
plot(nClusters(intern), measures(intern, "Dunn")[, , 1], type="n",
     axes=F, xlab="", ylab="")
legend("center", clusterMethods(intern), col = 1:7, lty = 1:7,
       pch = paste(1:7))
par(op)
#dev.off()

#postscript("val_sta.ps")
op <- par(no.readonly=TRUE)
par(mfrow = c(2,2), mar=c(4,4,3,1))
plot(stability, measure=c("APN", "AD", "ADM"), legend=FALSE)
plot(nClusters(stability), measures(stability, "APN")[, , 1], type="n",
     axes=F, xlab="", ylab="")
legend("center", clusterMethods(stability), col = 1:4, lty = 1:4,
       pch = paste(1:4))
par(op)
#dev.off()

hc1=hclust(dist(normal, method="euclidean"), method="ward")
plot(hc1, hang=-1)
