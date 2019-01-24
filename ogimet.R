#File lista
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

ttdate <- paste(c(rep(2017,11),rep(2018,365),rep(2019,23)),teljes$Date,sep="/")
teljes$Date <- ttdate

library(xts)
temps.xts <- xts(teljes[,2:4], as.Date(teljes$Date))

## Ábrázolás
plot(temps.xts)

plot(temps.xts["2018-05"])

mean(temps.xts["2018-05","tavg"])
mean(temps.xts["2018","tavg"])

## Save to Excel compat.
write.csv2(teljes,"teljes.csv",row.names = FALSE)
plot(temps.xts["2018",c("tmin","tmax")])
plot(temps.xts["2018"])

temps2018.zoo <- as.zoo(temps.xts["2018"])

plot.zoo(temps2018.zoo$tavg, xaxs="i", ylim=c(min(temps2018.zoo),max(temps2018.zoo)),lwd=2,xlab="",ylab="Temp")
lines(temps2018.zoo$tmin, col="blue")
lines(temps2018.zoo$tmax, col="red")
legend("topleft", legend=c("Max","Ave","Min"), lwd=c(1,2,1), col=c("red","black","blue"))


##Polygonnal
plot.zoo(temps2018.zoo$tavg, xaxs="i", ylim=c(min(temps2018.zoo),max(temps2018.zoo)),type="n",xlab="",ylab="Temp")
minmax.df <- data.frame(Ido=c(index(temps2018.zoo),index(temps2018.zoo)[nrow(temps2018.zoo):1]),Bound=c(coredata(temps2018.zoo$tmin),coredata(temps2018.zoo$tmax)[nrow(temps2018.zoo):1]))
polygon(minmax.df,col="lightgrey")
lines(temps2018.zoo$tavg, lwd=2)
