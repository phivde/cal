# script.R
# Installer/charger les packages requis
if (!require("calendar")) install.packages("calendar")
library(calendar)
# lecture M1 CEPE
ics_M1 = ic_read("https://calendar.google.com/calendar/ical/mdjlce93a22mdeq2njgmgjujto%40group.calendar.google.com/public/basic.ics")
head(ics_M1)
# lecture M2 CEPE
ics_M2 = ic_read("https://calendar.google.com/calendar/ical/0h4ucbt6c4ermrtaehgidndbdk%40group.calendar.google.com/public/basic.ics")
head(ics_M2)
Fusion <- result <- bind_rows(ics_M1,ics_M2)
Extrait <- subset(Fusion,grepl('EECKAUT',SUMMARY)) 
head(Extrait)

# Ecriture du fichier filtré
ic_write(ical(Extrait),  "Extrait.ics")
# Ecriture du fichier global
# ic_write(ical(Fusion),  "CEPE.ics")
