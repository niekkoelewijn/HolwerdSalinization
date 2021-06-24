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

#load required packages
library(shiny)
library(raster)
library(rgdal)
library(shinythemes)
library(leaflet)
library(sf)
library(exactextractr)

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

# Calculate NDRE of every image
s2_images_NDVI <- lapply(s2_images_cloudfree, calculate_NDVI)

# Calculate NDRE of every image
s2_images_NDRE <- lapply(s2_images_cloudfree, calculate_NDRE)







