# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

# Remove clouds from images (characterized by high (>2250) reflectance in blue spectrum)
# This is a simplified method to reduce the influence of clouds in the classification

mask_clouds <- function(raster){
  #this function assign NA if the value for the blue band is higher than 2250
  raster[raster$B2 > 2250] <- NA
  return(raster)
}