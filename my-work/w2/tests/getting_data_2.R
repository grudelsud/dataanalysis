setwd("~/Documents/Courses/Data Analysis/data/cameras")
getwd()

connection <- file('./data/cameras.csv', 'r')
cameras <- read.csv(connection)
close(connection)

install.packages('RJSONIO')
library('RJSONIO')
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.json?accessType=DOWNLOAD"
download.file(fileUrl, destfile='./data/cameras.json', method='curl')

connection <- file('./data/cameras.json')
cameraJson <- fromJSON(connection)
close(connection)

head(cameras)
head(cameraJson)

cameraJson$meta$view$tags