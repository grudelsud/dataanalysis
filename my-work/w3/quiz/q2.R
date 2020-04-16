library(ElemStatLearn)
data(marketing)
plot(bone$age,bone$spnbmd,pch=19,col=((bone$gender=="male")+1))
boxplot(marketing$Income ~ marketing$Marital,col="grey",xaxt="n",ylab="Income",xlab="",varwidth=TRUE)
axis(side=1,at=1:5,labels=c("Married","Living together/not married","Divorced or separated","Widowed","Nevermarried"),las=2)

