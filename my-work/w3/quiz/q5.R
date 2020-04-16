library(ElemStatLearn)
data(zip.train)

# Using the zip2image file, create an image matrix for the 8th and 18th rows. 
# For each image matrix calculate the svd of the matrix (with no scaling)

im8 = zip2image(zip.train,8)
im18 = zip2image(zip.train,18)

svd8 = svd(im8)
svd18 = svd(im18)

par(mfrow=c(1,2))

image(im8)
plot(svd8$d^2/sum(svd8$d^2), ylab="percent of variance explained")
dev.copy2pdf(file="im8_explained.pdf")

image(im18)
plot(svd18$d^2/sum(svd18$d^2), ylab="percent of variance explained")
dev.copy2pdf(file="im18_explained.pdf")

exp8 = svd8$d^2/sum(svd8$d^2)
exp18 = svd18$d^2/sum(svd18$d^2)

exp8[1]
exp18[1]