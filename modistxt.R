tteszt <- read.table("Evapopro.txt", sep=",", quote="", skip=1, fill=TRUE)
summary(tteszt)

ttfejlec <- read.table("Evapopro.txt", sep=",", nrows=1, stringsAsFactors=FALSE)

adat <- tteszt[,1:8]
names(adat) <- ttfejlec[1:8]

summary(adat)

write.csv2(adat, "MODIS_ET_PET.csv", row.names = FALSE)

adatjo <- adat[,-c(1:2,4:6)]
adatjo$Koord <- as.factor(paste(sub("\"","",as.character(adat[,1])), adat[,2], sep=":"))

MODISdate <- as.Date(adatjo$Date)

elso <- adatjo[adatjo$Koord == "47.882619:18.174956", c("Date", "MOD16A2_006_ET_500m", "MOD16A2_006_PET_500m")]
masodik <- adatjo[adatjo$Koord == "47.893236:18.152071", c("Date", "MOD16A2_006_ET_500m", "MOD16A2_006_PET_500m")]
harmadik <- adatjo[adatjo$Koord == "47.893236:18.174956", c("Date", "MOD16A2_006_ET_500m", "MOD16A2_006_PET_500m")]

masodik[masodik[,2] > 32000, 2] <- NA
masodik[masodik[,3] > 32000, 3] <- NA
harmadik[harmadik[,2] > 32000, 2] <- NA
harmadik[harmadik[,3] > 32000, 3] <- NA

plot(as.Date(masodik$Date), masodik[,3])
points(as.Date(masodik$Date), masodik[,2], col=2)
plot(as.Date(harmadik$Date), harmadik[,3])
points(as.Date(harmadik$Date), harmadik[,2], col=2)

write.csv2(masodik, "MODISmasodik.csv", row.names = FALSE)
write.csv2(masodik, "MODISharmadik.csv", row.names = FALSE)
