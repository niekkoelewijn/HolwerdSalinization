# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

# Create a function to calculate the mean VI value for a plot per given date 
calculate_statistics <- function(plots, date, VI){
  if(VI == "NDRE"){
    plots$date <- exact_extract(s2_images_NDRE[[date]], plots, 'mean')
  }
  if(VI == "NDVI"){
    plots$date <- exact_extract(s2_images_NDVI[[date]], plots, 'mean')
  }
}

# Create columns for Corn_plots
for (i in s2_images_names){
  Corn_plots[i] <- NA
}

for (i in 1:length(s2_images_names)){
  calculate_statistics(Corn_plots, as.factor(s2_images_names[i]), "NDVI")
}