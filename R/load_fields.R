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
  fields_plots_CRS <- sf::st_transform(train_poly, targetCRS)
  
  # create new column and assign value to land classifications
  fields_plots_CRS$Description[fields_plots_CRS[1:4]] <- 1

  #give plots description "impact" & "validation
  fields_plots_CRS$Description[1:4] <- "impact"
  fields_plots_CRS$Description[5:8] <- "validation"
  
  return(fields_plots_CRS)
}