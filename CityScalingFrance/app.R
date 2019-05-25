#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(sf)
library(dplyr)
library(leaflet)
library(tmap)
library(ggplot2)

# Read Shapefile of Compiled Data
urbanPerfData = st_read("./DATA/urbanAreas.shp")
urbanIndicators = st_read("./DATA/urbanIndicators.shp")

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("City Scaling in France"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         selectInput("var",
                     label = "Select Variable",
                     choices = c("Employment" = "emp_diff", 
                                    "Firms" = "entre_diff", 
                                    "New Firm Incorporation" = "entre_diff",
                                    "Professional Labor" = "prof_diff",
                                    "Intellectuals" = "int_diff",
                                    "Gas Stations" = "serv_diff")
                     )
         
         ),
         # Show a plot of the generated distribution
         mainPanel(
                 leafletOutput("map"),
                 plotOutput("linearFit"),
                 textOutput("stats")
         )
      
   )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$map = renderLeaflet({
           # Generate Map
           tm = tm_shape(urbanPerfData) + 
                   tm_borders("white", lwd = .5) +
                   tm_polygons(input$var) + # User selects the mapped variable
                   tm_text("libau2010", size = .5, clustering = TRUE)
           tmap_leaflet(tm)
   })
   
   output$linearFit <- renderPlot({
           ggplot(urbanIndicators, aes(x = log(ppltn15), y = log(emply15))) + 
                   geom_point() +
                   stat_summary(fun.data=mean_cl_normal) + 
                   geom_smooth(method='lm')
   })
   
   output$stats = renderPrint({ lm(log(ppltn15) ~ log(emply15), data = urbanIndicators) %>% 
                   summary()
           
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

