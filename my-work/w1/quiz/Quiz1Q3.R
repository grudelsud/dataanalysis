set.seed(31);
heightsCM = rnorm(30,mean=188, sd=5);
weightsK = rnorm(30,mean=84,sd=3); 
hasDaughter = sample(c(TRUE,FALSE),size=30,replace=T); 
dataFrame = data.frame(heightsCM,weightsK,hasDaughter);

dataFrameSubset = dataFrame[heightsCM > 188, ]
quizAnswer = mean(dataFrameSubset$weightsK)