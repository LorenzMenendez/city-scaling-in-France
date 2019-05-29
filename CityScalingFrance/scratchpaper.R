
# Testing ggplot
ggplot(urbanIndicators, aes(x = log(ppltn15), y = log(emply15))) + 
        geom_point() +
        stat_smooth(method = "lm", col = "red")

lm(log(ppltn15) ~ log(emply15), data = urbanIndicators) %>% 
        summary()

# Wrangling Data into a single .shp
urbanData = left_join(as.data.frame(urbanIndicators), as.data.frame(urbanPerfData), by = "au2010") %>%
        st_as_sf() %>% 
        st_drop_geometry() %>% 
        select(-(geometry.y))

write.csv(urbanData, file = "./DATA/urbanData.csv")

xlog = "log(ppltn15)"
ylog = "log(input$var)"

ggplot(urbanIndicators, aes_string(x = xlog, y = ylog)) + 
        geom_point() +
        stat_summary(fun.data=mean_cl_normal) + 
        geom_smooth(method='lm')

plotData = st_read("./DATA/urbanIndicators.shp") %>% 
        mutate(ppltn15 = log(ppltn15),
               emply15 = log(emply15),
               entrp15 = log(entrp15),
               nvntr15 = log(nvntr15),
               prfss15 = log(prfss15))

statData = read.csv("./DATA/urbanData.csv") %>% 
        mutate(ppltn15 = log(ppltn15),
               emply15 = log(emply15),
               entrp15 = log(entrp15),
               nvntr15 = log(nvntr15),
               prfss15 = log(prfss15))

lm((ppltn15 ~ emply15), data = statData) %>%  
        summary()

ggplot(plotData, aes(x = ppltn15, y = stnserv)) + 
        geom_point() +
        stat_summary(fun.data=mean_cl_normal) + 
        geom_smooth(method='lm') +
        ggtitle("Selected Variable as a function of Population") +
        scale_x_continuous(name = "ln(Population)", labels = comma) +
        scale_y_continuous(name = "ln(Selected Variable)", labels = comma)

        
       