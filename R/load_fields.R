# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

load_fields <- function(path, targetRaster){
  
  # create variable with desired crs
  targetCRS <- sf::st_crs(targetRaster)
  
  # Load data and set to correct crs
  fields <- sf::st_read(dsn = path)
  fields_plots_CRS <- sf::st_transform(fields, targetCRS)

  #give plots description "monitoring" & "validation"
  fields_plots_CRS$Description[1:4] <- "monitoring"
  fields_plots_CRS$Description[5:8] <- "validation"
  
  return(fields_plots_CRS)
}