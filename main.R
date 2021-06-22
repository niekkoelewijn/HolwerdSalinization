# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

library(raster)

datdir <- "./data"
if (!dir.exists(datdir)){
  dir.create(datdir, showWarnings = FALSE)
}

downloadlink <- "https://drive.google.com/uc?export=download&id=1gAUnzkTQxME1eWIgWvgMVmtOajlGRAUW"

download.file(url = downloadlink, destfile = './data/April2020.tif', method = 'auto')

April2020 <- brick("./data/April2020.tif")

