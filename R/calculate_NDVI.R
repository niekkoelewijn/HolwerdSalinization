# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

# Calculation of the NDVI
calculate_NDVI <- function(raster){
  
  # Select the REDedge and NIR bands of the input raster
  raster_RED <- raster$B4
  raster_NIR <- raster$B8
  
  # Calculates the vi
  NDVI <- (raster_NIR-raster_RED)/(raster_NIR+raster_RED)
  NDVI[NDVI <= 0] <- NA
  
  # Return output raster
  return(NDVI)
}