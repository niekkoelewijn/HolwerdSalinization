# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

# Create a function to calculate the mean VI value for a plot per given date 
calculate_statistics <- function(plots, name, number, VI){
  if(VI == "NDRE"){
    plots[name] <- exact_extract(s2_images_NDRE[[number]], plots, 'mean')
    cappend()
  }
  if(VI == "NDVI"){
    plots[name] <- exact_extract(s2_images_NDVI[[number]], plots, 'mean')
  }
}

# Create columns for the mean values of the VI's per date for both crops
for (i in s2_images_names){
  Corn_plots_NDVI[i] <- NA
}

for (i in s2_images_names){
  Corn_plots_NDRE[i] <- NA
}

for (i in s2_images_names){
  Potato_plots_NDVI[i] <- NA
}

for (i in s2_images_names){
  Potato_plots_NDRE[i] <- NA
}

# Calculate the mean 
for (i in 1:length(s2_images_names)){
  Corn_plots_NDVI[s2_images_names[i]] <- calculate_statistics(plots=Corn_plots_NDVI,
                                                              name=s2_images_names[i],
                                                              number=i,
                                                              VI="NDVI")
}

