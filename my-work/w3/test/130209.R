getwd()
pData <- read.csv("ss06pid.csv")
boxplot(pData$AGEP)
boxplot(pData$AGEP ~ as.factor(pData$MAR), varwidth=TRUE, names=c("married", "widowed", "divorced", "sep", "never"))

barplot(table(pData$ENG))
hist(pData$AGEP, col="orange", breaks=20)
dens <- density(pData$AGEP)
plot(dens, lwd=2)

# can be created at the beginning
# pdf(file="age_versus_wage.pdf", height=4, width=8)
# split next image to fit 2 graphs
par(mfrow=c(1,2))
# introduce color as variable
hist(pData$AGEP, col="orange", breaks=20,xlab="age (years)", ylab="freq (number)", main="age frequency")
# add a label
mtext(text="(a)", side=1, line=5)

percentMaxAge = pData$AGEP / max(pData$AGEP)
# color is a variable
plot(pData$JWMNP, pData$WAGP, pch=20, col=pData$SEX, cex=percentMaxAge*0.6,xlab="commuting time (minutes)", ylab="wage (dollars)", main="wages vs commuting time")
# add a legend
legend(100, 200000, legend=c('men', 'women'), col=pData$SEX, pch=c(20,20))
# add another label
mtext(text="(b)", side=1, line=5)

#closes the pdf generation
# dev.off()
# or copied at the end
dev.copy2pdf(file="age_versus_wage.pdf")

# now cut ages in groups
library(Hmisc)
ageGroups = cut2(pData$AGEP, g=5)
plot(pData$JWMNP, pData$WAGP, pch=20, col=ageGroups, cex=0.5)


x = rnorm(1e5)
y = rnorm(1e5)
xsample = sample(x, 500)
ysample = sample(y, 500)
plot(xsample, ysample, pch=20)
smoothScatter(x,y)

library(hexbin)
hb = hexbin(x,y)
plot(hb)

# check if we're going out of the normal distribution with qqplot, showing the quantiles
qqplot(pData$WAGP, pData$AGEP)

# matplot used for longitudonal analysis (spaghetti plot)
X = matrix(rnorm(20*5),nrow=20)
matplot(X,type="b")

library(maps)
map('italy')