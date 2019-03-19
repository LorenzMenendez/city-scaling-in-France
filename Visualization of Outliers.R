library(RPostgreSQL)
library(postGIStools)
library(rgdal)
library(rgeos)
library(sp)
library(tmap)
library(leaflet)

# Setting up the Database Connection
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, 
                 user = keyring::key_list("gis2")[1,2],
                 password = keyring::key_get("gis2"),
                 dbname = "gis2", 
                 port = 5432,
                 host = "localhost")

#Getting the Data for Urban Indicators from PostGIS
urbanareas.sp <- get_postgis_query(con, "SELECT * FROM final.indicateurs_diff", geom_name = "geom")

# Set tmap to do interactive maps 
tmap_mode("view")

# Custom Interactive Maps of Urban Area Indicator Data
emp_diff.map <- tm_shape(urbanareas.sp) + tm_borders(alpha=.5) + tm_fill(
        
        #Aesthetic Settings in tm_fill
        col = "emp_diff",
        id = "libau2010",
        style = "sd", 
        title = "Percent Difference in Anticipated Employment",
        legend.show = TRUE, 
        popup.vars = "emp_diff"
)

entre_diff.map <- tm_shape(urbanareas.sp) + tm_borders(alpha=.5) + tm_fill(
        
        #Aesthetic Settings in tm_fill
        col ="entre_diff",
        id = "libau2010",
        style = "sd", 
        title = "Percent Difference in Anticipated Total Businessess", 
        legend.show = TRUE, 
        popup.vars = "entre_diff"
)

new_diff.map <- tm_shape(urbanareas.sp) + tm_borders(alpha=.5) + tm_fill(
        
        #Aesthetic Settings in tm_fill
        col ="new_diff",
        id = "libau2010",
        style = "sd", 
        title = "Percent Difference in Anticipated New Business Creation", 
        legend.show = TRUE, 
        popup.vars = "new_diff"
)

prof_diff.map <- tm_shape(urbanareas.sp) + tm_borders(alpha=.5) + tm_fill(
        
        #Aesthetic Settings in tm_fill
        col ="prof_diff",
        id = "libau2010",
        style = "sd", 
        title = "Percent Difference in Anticipated Number of Professionals", 
        legend.show = TRUE, 
        popup.vars = "prof_diff"
)

int_diff.map <- tm_shape(urbanareas.sp) + tm_borders(alpha=.5) + tm_fill(
        
        #Aesthetic Settings in tm_fill
        col ="int_diff",
        id = "libau2010",
        style = "sd", 
        title = "Percent Difference in Anticipated Number of Intellectuals", 
        legend.show = TRUE, 
        popup.vars = "int_diff"
)

serv_diff.map <- tm_shape(urbanareas.sp) + tm_borders(alpha=.5) + tm_fill(
        
        #Aesthetic Settings in tm_fill
        col ="serv_diff",
        id = "libau2010",
        style = "sd", 
        title = "Percent Difference in Anticipated Number of Gas Stations", 
        legend.show = TRUE, 
        popup.vars = "serv_diff"
)

# Save all the created maps as html files
save_tmap(emp_diff.map, "EmploymentMap.html")
save_tmap(int_diff.map, "IntellectualsMap.html")
save_tmap(new_diff.map, "NewBusinessMap.html")
save_tmap(prof_diff.map, "ProfessionalstMap.html")
save_tmap(serv_diff.map, "GasStationsMap.html")