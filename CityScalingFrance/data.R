# Goal : Read and clean data from Shapefiles to be used in maps, plots and summary stats.

library(sf)
library(dplyr)

setwd("~/Google Drive/GitHub Projects/city-scaling-in-France/CityScalingFrance")

# Importing Data for the Map
mapData = st_read("./DATA/urbanAreas.shp") %>% 
        rename("emply15" = "emp_diff",
               "entrp15" = "entre_diff",
               "nvntr15" = "new_diff",
               "prfss15" = "prof_diff",
               "intll15" = "int_diff",
               "stnserv" = "serv_diff")

# Importing Data for the Plot
plotData = st_read("./DATA/urbanIndicators.shp") %>% 
        mutate(ppltn15 = log(ppltn15),
               emply15 = log(emply15),
               entrp15 = log(entrp15),
               nvntr15 = log(nvntr15),
               prfss15 = log(prfss15),
               intll15 = log(intll15),
               stnserv = log(stnserv))

# Importing Data for the Statistics
statData = read.csv("./DATA/urbanData.csv") %>% 
        mutate(ppltn15 = log(ppltn15),
               emply15 = log(emply15),
               entrp15 = log(entrp15),
               nvntr15 = log(nvntr15),
               prfss15 = log(prfss15),
               intll15 = log(intll15),
               stnserv = log(stnserv))