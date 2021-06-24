# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

# The means per monitoring and per validation should be calculated
means_per_site <- function(plotdf){
  
  # Create empty dataframe to save the mean values monitoring and validation plot
  resultdf <- data.frame(row.names = c("monitoring", "validation"))
  
  # For loop to loop over the dataframes of the different crops
  for (i in 1:length(s2_images_names)){
    vector <- st_drop_geometry(plotdf[s2_images_names[i]])
    monitoring <- vector[1:4,1]
    validation <- vector[5:8,1]
    monitoring_mean <- mean(monitoring)
    validation_mean <- mean(validation)
    resultdf[s2_images_names[i]] <- c(monitoring_mean, validation_mean)
  }
  
  # Return the filled in dataframe
  return(resultdf)
}

# Create variables of the dataframes with the mean per monitoring and validation plots  
Corn_NDVI_means <- means_per_site(Corn_plots_NDVI)
Corn_NDRE_means <- means_per_site(Corn_plots_NDRE)
Potato_NDVI_means <- means_per_site(Potato_plots_NDVI)
Potato_NDRE_means <- means_per_site(Potato_plots_NDRE)


