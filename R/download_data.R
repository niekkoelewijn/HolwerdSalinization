# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

DownloadData = function(URL, savename) {
  #Function that download file from URL and saves it. Returns a RasterStack
  #Two arguments. URL and savename how it should be saved in the data folder
  destinationname <- paste0('data/',savename,'.tif')
  download.file(url = as.character(URL), destfile = destinationname, method = 'auto') 
  Rasterstack = stack(destinationname)
  return(Rasterstack)
} 