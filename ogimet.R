teszt <- read.table("ET1901.txt", skip=24)
adat <- teszt[,1:16]
names(adat) <- c("Date","tmax","tmin","tavg","td","hr%","winddir","windint","windgust","airpress","Prec","TotOct","LowOct","sun","vis","snow")
