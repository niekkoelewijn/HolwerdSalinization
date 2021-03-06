# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

# Create a dates variable in the correct format
dates <- c("2019-03-19", "2019-03-29", "2019-04-16", "2019-04-23", "2019-05-13",
           "2019-05-16", "2019-06-22", "2019-07-17", "2019-07-27", "2019-08-24",
           "2019-08-26", "2019-09-10", "2019-09-13", "2019-10-10", "2019-10-30",
           "2019-12-12")

# Transpose created mean dataframes
Corn_NDRE_means <- transpose(Corn_NDRE_means)
colnames(Corn_NDRE_means) <- c("monitoring", "validation")
Corn_NDRE_means["Date"] <- as.Date(dates) 
rownames(Corn_NDRE_means) <- 1:16

Corn_NDVI_means <- transpose(Corn_NDVI_means)
colnames(Corn_NDVI_means) <- c("monitoring", "validation")
Corn_NDVI_means["Date"] <- as.Date(dates) 
rownames(Corn_NDVI_means) <- 1:16

Potato_NDRE_means <- transpose(Potato_NDRE_means)
colnames(Potato_NDRE_means) <- c("monitoring", "validation")
Potato_NDRE_means["Date"] <- as.Date(dates) 
rownames(Potato_NDRE_means) <- 1:16

Potato_NDVI_means <- transpose(Potato_NDVI_means)
colnames(Potato_NDVI_means) <- c("monitoring", "validation")
Potato_NDVI_means["Date"] <- as.Date(dates) 
rownames(Potato_NDVI_means) <- 1:16
