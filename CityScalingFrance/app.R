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
library(scales)
library(shinycssloaders)

# Required Data
source('~/Google Drive/GitHub Projects/city-scaling-in-France/CityScalingFrance/data.R', echo=TRUE)


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("City Scaling in France"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         selectInput("var",
                     label = "Select Variable",
                     choices = c("Employment" = "emply15", 
                                    "Firms" = "entrp15", 
                                    "New Firm Incorporation" = "nvntr15",
                                    "Professional Labor" = "prfss15",
                                    "Intellectuals" = "intll15",
                                    "Gas Stations" = "stnserv")
                     ),
         
         plotOutput("plot")
         
         ),
         # Show a plot of the generated distribution
         mainPanel(
                 leafletOutput("map") %>% 
                         withSpinner(type = 7, color="#800000")
                 # textOutput("stats")
         )
      
   )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
        output$plot <- renderPlot({
                
                ggplot(plotData, aes(x = ppltn15, y = !!as.symbol(input$var))) + 
                        geom_point() +
                        stat_summary(fun.data=mean_cl_normal) + 
                        geom_smooth(method='lm') +
                        ggtitle("Variable ~ Population") +
                        scale_x_continuous(name = "ln(Population)", labels = comma) +
                        scale_y_continuous(name = "ln(Selected Variable)", labels = comma)
                
        }) 
        
        output$map = renderLeaflet({
           # Generate Map
           tm = tm_shape(mapData) + 
                   tm_borders("white", lty = 2) +
                   tm_polygons(input$var,id = "libau2010", popup.vars = input$var) + # User selects the mapped variable
                   tm_text("libau2010", size = .5, clustering = TRUE)
                  
           tmap_leaflet(tm)
   })
   

   
        output$stats = renderPrint({ lm((ppltn15 ~ input$var), data = statData) %>%  
                   summary()
           
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

