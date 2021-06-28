# Holwerd Salinization Monitoring
Script to monitor salinization with remote sensing


## Background 
This project was part of the Remote Sensing and GIS integration course of the Wageningen University MGI master program. The commissioner for this project was Wiertsema & Partners. 

Louisa Heilinger, Niek Koelewijn, Marlot van Balveren, Jan Hooijmans & Thijs Koop 
29 June 2021

## Project
In Holwerd, there is a plan to reconnect the village to the sea by means of breaking the dyke and creating a salt water lake. This initiative is called "Holwerd aan Zee". At the moment, research is carried out to find out what effects this initiative would have on the surrounding areas. One of the research questions is what the effect of the salt water lake will be on the soil salinity of the agricultural fields in the vicinity of the salt water lake. Our project focusses on anwsering this research question by means of remote sensing techniques. In this script, the baseline salinity situation of the study area is assessed. Plots with corn and potato that border the to be constructed salt lake (monitoring plots) are compared to plots further away from the salt lake (validation plots). The development of the mean NDVI and NDRE per monitoring and validation plot is assessed for the year 2019.

## Discription
Via Google Earth Engine, sentinel images of 16 dates in 2019 of the study area are downloaded and uploaded in the data folder. The script can be find in the GEEJaveScript folder and via https://code.earthengine.google.com/a837f3e8674dfdeeeac2e5fcf28bdf21. With Google MyMaps, we have created the monitoring and validation plots for the different crops. We have downloaded those polygons and uploaded them into the data folder. The data is processed and analysed via the scripts in the R folder. If the user runs the script main.R, the complete analysis runs automatically. A R Shiny app launches when the script is done running. The first tab of the app contains a description of how the app could be used.

## Implement analysis on other study area / location
If one wants to perform this salinization assessment on an other study location, one can easily adapt the code of the Google Earth Engine script (  https://code.earthengine.google.com/a837f3e8674dfdeeeac2e5fcf28bdf21) and create new plots in Google MyMaps for the crop monitoring. 


