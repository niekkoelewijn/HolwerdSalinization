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
  }else{
    plots[name] <- exact_extract(s2_images_NDVI[[number]], plots, 'mean')
  }
}

# Calculate the mean NDVI per corn plot
for (i in 1:length(s2_images_names)){
  Corn_plots_NDVI[s2_images_names[i]] <- calculate_statistics(plots=Corn_plots_NDVI,
                                                              name=s2_images_names[i],
                                                              number=i,
                                                              VI="NDVI")
}

# Calculate the mean NDVI per potato plot
for (i in 1:length(s2_images_names)){
  Potato_plots_NDVI[s2_images_names[i]] <- calculate_statistics(plots=Potato_plots_NDVI,
                                                              name=s2_images_names[i],
                                                              number=i,
                                                              VI="NDVI")
}

# Calculate the mean NDRE per corn plot
for (i in 1:length(s2_images_names)){
  Corn_plots_NDRE[s2_images_names[i]] <- calculate_statistics(plots=Corn_plots_NDRE,
                                                              name=s2_images_names[i],
                                                              number=i,
                                                              VI="NDRE")
}

# Calculate the mean NDRE per potato plot
for (i in 1:length(s2_images_names)){
  Potato_plots_NDRE[s2_images_names[i]] <- calculate_statistics(plots=Potato_plots_NDRE,
                                                              name=s2_images_names[i],
                                                              number=i,
                                                              VI="NDRE")
}

