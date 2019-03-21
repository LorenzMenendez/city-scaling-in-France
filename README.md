# Scaling Relations in French Cities
An analysis of the relationship between population and city attributes

## Overview
This is the final project for my GIS II class, centered around the usage of a PostGIS database to model a city. I'm implementing the techniques used by Luís Bettencourt (University of Chicago) in his research of city scaling relations to urban indicators for French cities. See my [project proposal](https://github.com/LorenzMenendez/city-scaling-in-France/blob/master/Menendez%20Project%20Proposal.pdf "project proposal") for more details.

I'm studying the relationship between total population of a city `Population15` and the following urban indicators
* Total Employment `Employment15`
* Number of Artisans, Managers and CEOs `Professionels15`
* Number of Intellectuals and Academics `Intellectuels15`
* Total New Business Creation `Nouventreprises15`
* Number of Gas Stations `StnServ`

## Major Steps
- [x] Importing and wrangling data for population and urban indicators: Completed using ETL workflows from various spreadsheets, CSVs and Shapefiles to PostGIS with FME
- [x] Exploratory data analysis in GeoDa to view the relationship between urban variables
- [x] Formal data analysis with Server-Side Calculations: Find βs, R^2, 95% Confidence Interval and interpret results
- [x] Create interactive visualizations in R, then export as HTML for final report. See the R code [here](https://github.com/LorenzMenendez/city-scaling-in-France/blob/master/Data%20Visualization%20from%20PostGIS%20Database%20Code)
- [x] Final report with visualizations of our data

## Data Sources
* Institut national de la statistique et des études économiques (INSEE)
* Plateforme ouverte des données publiques françaises (data.gouv.fr) 
* OpenStreetMap
