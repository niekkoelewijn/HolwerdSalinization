# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

# Add statistics to vector data
Corn_plots$mean <- exact_extract(s2_images_NDRE[[1]], Corn_plots, 'mean')
Potato_plots$mean <- exact_extract(s2_images_NDRE[[1]], Potato_plots, 'mean')

calculate_statistics <- function(number_date){
  Corn_plots$number_date
  Potato_plots$number_date
}

for (i in 1:length(s2_images_names)){
  
}