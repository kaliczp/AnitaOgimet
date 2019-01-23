teszt <- read.table("ET1812.txt", skip=24, na.strings=c("Tr","----","---"))
teszt <- read.table("ET1901.txt", skip=24, na.strings=c("Tr","----","---"))

adat <- teszt[,1:16]
names(adat) <- c("Date","tmax","tmin","tavg","td","hr%","winddir","windint","windgust","airpress","Prec","TotOct","LowOct","sun","vis","snow")

teljes <- rbind(adat,teljes)
teljes <- adat


sum(teljes$Prec, na.rm=TRUE)

## Save to Excel compat.
write.csv2(adat,"adatteszt.csv")
