setwd("~/Documents/Courses/Data Analysis/data/cameras")
getwd()
dateDownload <- date()

# csv
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
# we're using curl because we have https
download.file(fileUrl, destfile='./data/cameras.csv', method='curl')

# xlsx
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
# we're using curl because we have https
download.file(fileUrl, destfile='./data/cameras.xlsx', method='curl')

list.files('./data')

cameraRead <- read.table('./data/cameras.csv', sep=",", header=TRUE)
head(cameraRead)

# install.packages('xlsx') before executing the read operation if not already done
install.packages('xlsx')
library('xlsx')
cameraRead <- read.xlsx2('./data/cameras.xlsx', sheetIndex=1)
head(cameraRead)
