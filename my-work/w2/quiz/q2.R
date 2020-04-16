blogUrl <- 'http://simplystatistics.tumblr.com/'

connection <- url(blogUrl)
simplyStats <- readLines(connection, 150)
close(connection)

simplyStatsCount <- nchar(simplyStats)

simplyStatsCount[2]
simplyStatsCount[45]
simplyStatsCount[122]
