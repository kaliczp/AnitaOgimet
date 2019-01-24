filenames <- dir(patt="ET")

i <- 1
teszt <- read.table(filenames[i], na.strings=c("Tr","----","---"), stringsAsFactor=FALSE)
adat <- teszt[,1:16]
names(adat) <- c("Date","tmax","tmin","tavg","td","hr%","winddir","windint","windgust","airpress","Prec","TotOct","LowOct","sun","vis","snow")

teljes <- adat

for(i in 2:length(filenames)) {
    print(i)
    teszt <- read.table(filenames[i], na.strings=c("Tr","----","---"), stringsAsFactor=FALSE)
    adat <- teszt[,1:16]
    names(adat) <- c("Date","tmax","tmin","tavg","td","hr%","winddir","windint","windgust","airpress","Prec","TotOct","LowOct","sun","vis","snow")
    teljes <- rbind(teljes,adat)
}

sum(teljes$Prec, na.rm=TRUE)

ttdate <- paste(c(rep(2017,11),rep(2018,366),rep(2019,23)),teljes$Date,sep="/")

library(xts)
temps.xts <- xts(teljes[,2:4], as.Date(ttdate))

## Save to Excel compat.
write.csv2(teljes,"teljes.csv")
