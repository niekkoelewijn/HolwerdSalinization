# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

# Calculation of the NDRE
calculate_NDRE <- function(raster){
  
  # Select the REDedge and NIR bands of the input raster
  raster_REDedge <- raster$B5
  raster_NIR <- raster$B8
  
  # Calculates the vi
  NDRE <- (raster_NIR-raster_REDedge)/(raster_NIR+raster_REDedge)
  NDRE[NDRE <= 0] <- NA
  
  # Return output raster
  return(NDRE)
}