ggplot(urbanIndicators, aes(x = log(ppltn15), y = log(emply15))) + 
        geom_point() +
        stat_smooth(method = "lm", col = "red")

lm(log(ppltn15) ~ log(emply15), data = urbanIndicators) %>% 
        summary()
