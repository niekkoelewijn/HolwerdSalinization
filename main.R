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

library(shiny)
library(raster)
library(shinythemes)
library(leaflet)
library(sf)

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
  dir.create(datdir, showWarnings = FALSE)
}

# Load the Sentinel data into a raster brick
August2019 <- brick("./data/August2019.tif")

