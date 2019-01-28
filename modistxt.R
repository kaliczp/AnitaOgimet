tteszt <- read.table("Evapopro.txt", sep=",", quote="", skip=1, fill=TRUE)
summary(tteszt)

ttfejlec <- read.table("Evapopro.txt", sep=",", quote="", nrows=1, fill=TRUE)
