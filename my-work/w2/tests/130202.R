setwd("~/Documents/Courses/Data Analysis/data")
getwd()
# this will install kernlab in /Library/Frameworks/R.framework/bla
install.packages('kernlab')
library('kernlab')
# load data spam from kernlab
data(spam)
dim(spam)
# now do something with data
set.seed(3435)
trainIndicator = rbinom(4601, size=1, prob=0.5)
# splitting training and test
table(trainIndicator)
trainSpam = spam[trainIndicator==1,]
testSpam = spam[trainIndicator==0,]
dim(trainSpam)
names(trainSpam)

# describe our dataset
head(trainSpam)
table(trainSpam$type)
plot(log10(trainSpam$capitalAve + 1) ~ trainSpam$type)
plot(log10(trainSpam[,1:4] + 1))
hCluster = hclust(dist(t(log10(trainSpam[,1:55]+1))))
plot(hCluster)
