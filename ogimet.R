filenames <- dir(patt="ET")

i <- 1
teszt <- read.table(filenames[i], skip=24, na.strings=c("Tr","----","---"))
adat <- teszt[,1:16]
names(adat) <- c("Date","tmax","tmin","tavg","td","hr%","winddir","windint","windgust","airpress","Prec","TotOct","LowOct","sun","vis","snow")

teljes <- adat

for(i in 2:length(filenames)) {
    print(i)
    teszt <- read.table(filenames[i], skip=24, na.strings=c("Tr","----","---"))
    adat <- teszt[,1:16]
    names(adat) <- c("Date","tmax","tmin","tavg","td","hr%","winddir","windint","windgust","airpress","Prec","TotOct","LowOct","sun","vis","snow")
    teljes <- rbind(teljes,adat)
}

sum(teljes$Prec, na.rm=TRUE)

## Save to Excel compat.
write.csv2(teljes,"teljes.csv")
