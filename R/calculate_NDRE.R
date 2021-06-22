# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

# Calculation of the NDRE
calc_ndre <- function(month_raster){
  
  # Select the REDedge and NIR bands of the input raster
  month_raster_REDedge <- month_raster$B5
  month_raster_NIR <- month_raster$B8
  
  # Calculates the vi
  NDRE <- (month_raster_NIR-month_raster_REDedge)/(month_raster_NIR+month_raster_REDedge)
  NDRE[NDRE <= 0] <- NA
  
  # Return output raster
  return(NDRE)
}