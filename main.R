# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

# Install required packages
if(!"raster" %in% rownames(installed.packages())){install.packages("raster")}
if(!"rgdal" %in% rownames(installed.packages())){install.packages("rgdal")}
if(!"sf" %in% rownames(installed.packages())){install.packages("sf")}
if(!"shiny" %in% rownames(installed.packages())){install.packages("shiny")}
if(!"shinythemes" %in% rownames(installed.packages())){install.packages("shinythemes")}
if(!"leaflet" %in% rownames(installed.packages())){install.packages("leaflet")}
if(!"exactextractr" %in% rownames(installed.packages())){install.packages("exactextractr")}
if(!"dplyr" %in% rownames(installed.packages())){install.packages("dplyr")}
if(!"ggplot2" %in% rownames(installed.packages())){install.packages("ggplot2")}
if(!"hrbrthemes" %in% rownames(installed.packages())){install.packages("hrbrthemes")}
if(!"data.table" %in% rownames(installed.packages())){install.packages("data.table")}



#load required packages
library(shiny)
library(raster)
library(rgdal)
library(shinythemes)
library(leaflet)
library(sf)
library(exactextractr)
library(dplyr)
library(ggplot2)
library(hrbrthemes)
library(data.table)


# Make a data directory if it not exists
#datdir <- "./data"
#if (!dir.exists(datdir)){
#  dir.create(datdir, showWarnings = FALSE)
#}

# Make a output directory if it not exists
outdir <- "./output"
if (!dir.exists(outdir)){
  dir.create(outdir, showWarnings = FALSE)
}

# Source to required functions
source("./R/download_data.R")
source("./R/load_data.R")
source("./R/calculate_NDRE.R")
source("./R/calculate_NDVI.R")
source("./R/load_fields.R")
source("./R/mask_clouds.R")

# Calculate NDRE of every image
s2_images_cloudfree <- lapply(s2_images, mask_clouds)

# Calculate NDVI of every image
s2_images_NDVI <- lapply(s2_images_cloudfree, calculate_NDVI)

# Calculate NDRE of every image
s2_images_NDRE <- lapply(s2_images_cloudfree, calculate_NDRE)

# Calculate mean NDRE and NDVI for every plot
source("./R/calculate_statistics.R")

# Create dataframes with the mean NDRE and NDVI for monitoring plots and validation plots
source("./R/means_per_site.R")

# Create a visualization of the NDRE and NDVI for monitoring plots and validation plots
source("./R/graph_visualization.R", echo = T)

# Source and run Shiny application
source("./R/useShiny.R")
shinyApp(ui = ui, server = server)

ggplot() +
  geom_line(data = Potato_NDVI_means, aes(Date, monitoring, color="Monitoring"), size=1)+
  geom_line(data = Potato_NDVI_means, aes(Date, validation, color="Validation"), size=1)+
  scale_color_manual(values=c("steelblue1","steelblue4"))+
  geom_point(data = Potato_NDVI_means, aes(y=monitoring, x=Date))+
  geom_point(data = Potato_NDVI_means, aes(y=validation, x=Date))+
  ylab("Mean NDVI")+
  xlab("2019")+
  ggtitle("Timeseries of the mean NDVI of Potato plots")+
  scale_x_continuous(breaks = round(seq(min(Potato_NDVI_means$Date), max(Potato_NDVI_means$Date), by = 62),1),
                     labels = c("19 March", "20 May", "21 July", "21 September", "22 November"))+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))
