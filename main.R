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

# source the preprocess script for leaflet maps
source("./R/preprocces_leaflet.R")

# Source and run Shiny application
source("./R/useShiny.R")
shinyApp(ui = ui, server = server)
