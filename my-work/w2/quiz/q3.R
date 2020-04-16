dataUrl <- 'https://dl.dropbox.com/u/7710864/data/csv_hid/ss06hid.csv'
dataUrlPop <- 'https://dl.dropbox.com/u/7710864/data/csv_hid/ss06pid.csv'

setwd("~/Documents/Courses/Data Analysis/data/american_comm_survey")
getwd()

dateDownload <- date()
download.file(dataUrl, destfile='./data/ss06hid.csv', method='curl')
download.file(dataUrlPop, destfile='./data/ss06pid.csv', method='curl')

# pop is used for q10 only
surveyData <- read.csv('./data/ss06hid.csv')
surveyDataPop <- read.csv('./data/ss06pid.csv')
names(surveyData)
names(surveyDataPop)

# bit of descriptions
countValues <- table(surveyData$VAL)
summary(surveyData)
dim(surveyData)

# value of 24 means house is > $1,000,000 as defined in codebook
q3answer <- countValues[24]

# answer to q4 is purely theorical: each single variable should be 
# expressed in a separate column while FES is family type AND employment status
q4answer <- table(surveyData$FES)

# q5

# 3 bedrooms and and 4 total rooms?
q5_1 <- which(surveyData$BDS == 3 & surveyData$RMS == 4)
length(q5_1)

# good ol' subsetting instead of using posh functions
q5_1b <- surveyData[surveyData$BDS == 3,]
q5_1b <- q5_1b[q5_1b$RMS == 4,]
table(q5_1b$RMS)

# How many households have 2 bedrooms and 5 total rooms? 
q5_2 <- which(surveyData$BDS == 2 & surveyData$RMS == 5)
length(q5_2)

# How many households have 2 bedrooms and 7 total rooms?
q5_3 <- which(surveyData$BDS == 2 & surveyData$RMS == 7)
length(q5_3)

# q6 
# Create a logical vector that identifies the households on greater than 10 acres 
# who sold more than $10,000 worth of agriculture products.
q6 <- which(surveyData$ACR == 3 & surveyData$AGS == 6)
#alternatively
agricultureLogical <- surveyData$AGS == 6 & surveyData$ACR == 3
indexes = which(agricultureLogical)

#q7
subsetDataFrame = surveyData[indexes,]
# this is used for the quiz answer (read NA's value)
summary(subsetDataFrame$MRGX)
# play a bit with data
quantile(subsetDataFrame$BDS)
quantile(subsetDataFrame$RMS)

#q8
splitNames = strsplit(names(surveyData), "wgtp")
splitNames[[123]]

#q9
quantile(surveyData$YBL, na.rm = TRUE)
summary(surveyData$YBL)
table(surveyData$YBL)

#q10
housingData <- surveyData
populationData <- surveyDataPop
mergedData <- merge(populationData, housingData, by = "SERIALNO", all = TRUE)
dim(mergedData)