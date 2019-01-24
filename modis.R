library(ncdf4)
teszt <- nc_open("PET/MOD16A2.006_500m_aid0001.nc")
##nevek
teszt
### Dimenziók
## Szélesség
ncvar_get(teszt, "lat")
## Hosszúság
ncvar_get(teszt, "lon")
## Idő
ncvar_get(teszt, "time")
## Értelmezhető idő
as.Date("2000-01-01") + ncvar_get(teszt, "time")

##
ncvar_get(teszt, "ET_500m")
ncvar_get(teszt, "ET_500m", c(19,22,), c(1,1,))

H1 <- ncvar_get(teszt, "ET_500m", c(19,22,1), c(1,1,47))
H2 <- ncvar_get(teszt, "ET_500m", c(18,22,1), c(1,1,47))
H3 <- ncvar_get(teszt, "ET_500m", c(19,21,1), c(1,1,47))
H4 <- ncvar_get(teszt, "ET_500m", c(18,21,1), c(1,1,47))

data.frame(H1,H2,H3,H4)

PETH1 <- ncvar_get(teszt, "PET_500m", c(19,22,1), c(1,1,47))
PETH2 <- ncvar_get(teszt, "PET_500m", c(18,22,1), c(1,1,47))
PETH3 <- ncvar_get(teszt, "PET_500m", c(19,21,1), c(1,1,47))
PETH4 <- ncvar_get(teszt, "PET_500m", c(18,21,1), c(1,1,47))

data.frame(PETH1,PETH2,PETH3,PETH4)
