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

library(shiny)
library(raster)
library(rgdal)
library(shinythemes)
library(leaflet)
library(sf)
library(exactextractr)

# Source to required functions
source("./R/download_data.R")
source("./R/load_data.R")
source("./R/calculate_NDRE.R")
source("./R/load_fields.R")

# Make a data directory
datdir <- "./data"
if (!dir.exists(datdir)){
  dir.create(datdir, showWarnings = FALSE)
}

outdir <- "./output"
if (!dir.exists(outdir)){
  dir.create(outdir, showWarnings = FALSE)
}

# Calculate NDRE of every month
s2_images_NDRE <- lapply(s2_images, calc_ndre)

# Load corn and potato fields into R
Corn_plots <- load_fields("./data/Corn_monitoring.kml", s2_images_NDRE[[1]])
Potato_plots <- load_fields("./data/Potato_monitoring.kml", s2_images_NDRE[[1]])

# Add statistics to vector data
Corn_plots$mean <- exact_extract(s2_images_NDRE[[1]], Corn_plots, 'mean')
Potato_plots$mean <- exact_extract(s2_images_NDRE[[1]], Potato_plots, 'mean')


