# City Scaling in France — Shiny App

## Goal
The goal is to present the fingings on French city scaling in an interactive format. In the Shiny App, the user will be able to select a variable which will then change which map and graph plot is displayed.

## Work Completed
* Read-In data from a shapefile, generated from a PostGIS database after having to debug the server for about an hour
* Created a drop-down menu with name variables
* Rendered a tmap map based on the drop-down selection. 
* Rendered a plot showing city datapoints as a function of population as well as the linear regeression fit
* Displayed the output of summar statistics for the linear fit
* Made the drop-down menu selection also affect the plot and text output of linear fit
* Made the map prettier by changing the aesthetics

## Further Extensions
* Change the formatting of the output text so that it's real
* Optimize tmap rendering by simplifying the map geometry. Right now it just takes too long! 

## Citations
* Angela Li' (UChicago) — [R Workshop](https://spatialanalysis.github.io/workshop-notes/)
* Stackoverflow/Stackexchange
* Shiny CSS Loaders Package — [GitHub](https://github.com/andrewsali/shinycssloaders)
