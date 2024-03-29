#Problem 2
tableReaded<-read.table("./ml-100k/u.item", sep="|",encoding='latin1',fill=TRUE,quote="")
year <-format(tableReaded$V3,format="%Y")
year <- sub('.*(\\d{4}).*', '\\1', year)
movieName<-substr(tableReaded$V2,0,nchar(tableReaded$V2)-6)
movieNameLength <- nchar(movieName, type = "chars", allowNA = TRUE, keepNA = NA)
tableReaded$nameLength <-c(movieNameLength)
tableReaded$extractedYear <- c(year)
afterMean <-tapply(tableReaded$nameLength,tableReaded$extractedYear,mean)
afterMean<-afterMean[-1];
releaseYears <- c()
releaseYears<-c(releaseYears,"1922")
releaseYears<-c(releaseYears,"1926")
for(x in 1930:1998){
  releaseYears<-c(releaseYears,x)
}

plotted<-plot(afterMean,releaseYears,xlab="Movie Name Length", ylab="ReleaseYear")
title(main="Mean Release Year against Movie Name Length",font.main=2,cex.main=1,col.main="red")
