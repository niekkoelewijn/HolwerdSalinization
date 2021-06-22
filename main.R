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

# Make a data directory
datdir <- "./data"
if (!dir.exists(datdir)){
  dir.create(datdir, showWarnings = FALSE)
}

# Download MODIS data from drive
downloadlink <- "https://drive.google.com/uc?export=download&id=1gAUnzkTQxME1eWIgWvgMVmtOajlGRAUW"
download.file(url = downloadlink, destfile = './data/April2020.tif', method = 'auto')

# Load the Sentinel data into a raster brick
April2020 <- brick("./data/April2020.tif")

