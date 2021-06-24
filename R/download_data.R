# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

download_data = function(url, savename) {
  #Function that download file from url and saves it. Returns a RasterBrick
  #Two arguments. url and savename how it should be saved in the data folder
  destinationname <- paste0('./data/',savename,'.tif')
  download.file(url = as.character(url), destfile = destinationname, method = 'auto') 
  Rasterbrick = brick(destinationname)
  return(Rasterbrick)
} 