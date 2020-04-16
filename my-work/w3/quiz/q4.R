load('../data/quiz3question4.rda')
summary(dataSet)
plot(dataSet$x, dataSet$y, pch=20, col="#AA6600")

kMeansObj = kmeans(dataSet, centers=2, nstart=3)
names(kMeansObj)
kMeansObj$cluster

plot(dataSet$x, dataSet$y, pch=20, col=kMeansObj$cluster)
points(kMeansObj$centers, col=1:2, pch=3, cex=3, lwd=3)