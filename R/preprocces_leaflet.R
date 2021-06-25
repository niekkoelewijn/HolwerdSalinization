# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

#create leaflet maps

## Data preparation for NDVI leaflet map
corn_mon_NDVI <- Corn_plots_NDVI[1:4,(1+3)]
corn_val_NDVI <- Corn_plots_NDVI[5:8,(1+3)]
potato_mon_NDVI <- Potato_plots_NDVI[1:4,(1+3)]
potato_val_NDVI <- Potato_plots_NDVI[5:8,(1+3)]

# Transform to correct EPSG and drop z dimension
corn_mon_NDVI <- st_as_sf(corn_mon_NDVI)
corn_mon_NDVI <- sf::st_transform(corn_mon_NDVI, 4326)
corn_mon_NDVI <- st_zm(corn_mon_NDVI, drop = T, what = "ZM")

corn_val_NDVI <- st_as_sf(corn_val_NDVI)
corn_val_NDVI <- sf::st_transform(corn_val_NDVI, 4326)
corn_val_NDVI <- st_zm(corn_val_NDVI, drop = T, what = "ZM")

potato_mon_NDVI <- st_as_sf(potato_mon_NDVI)
potato_mon_NDVI <- sf::st_transform(potato_mon_NDVI, 4326)
potato_mon_NDVI <- st_zm(potato_mon_NDVI, drop = T, what = "ZM")

potato_val_NDVI <- st_as_sf(potato_val_NDVI)
potato_val_NDVI <- sf::st_transform(potato_val_NDVI, 4326)
potato_val_NDVI <- st_zm(potato_val_NDVI, drop = T, what = "ZM")

# Data preparation for NDRE leaflet map
corn_mon_NDRE <- Corn_plots_NDRE[1:4,(1+3)]
corn_val_NDRE <- Corn_plots_NDRE[5:8,(1+3)]
potato_mon_NDRE <- Potato_plots_NDRE[1:4,(1+3)]
potato_val_NDRE <- Potato_plots_NDRE[5:8,(1+3)]

# Transform to correct EPSG and drop z dimension
corn_mon_NDRE <- st_as_sf(corn_mon_NDRE)
corn_mon_NDRE <- sf::st_transform(corn_mon_NDRE, 4326)
corn_mon_NDRE <- st_zm(corn_mon_NDRE, drop = T, what = "ZM")

corn_val_NDRE <- st_as_sf(corn_val_NDRE)
corn_val_NDRE <- sf::st_transform(corn_val_NDRE, 4326)
corn_val_NDRE <- st_zm(corn_val_NDRE, drop = T, what = "ZM")

potato_mon_NDRE <- st_as_sf(potato_mon_NDRE)
potato_mon_NDRE <- sf::st_transform(potato_mon_NDRE, 4326)
potato_mon_NDRE <- st_zm(potato_mon_NDRE, drop = T, what = "ZM")

potato_val_NDRE <- st_as_sf(potato_val_NDRE)
potato_val_NDRE <- sf::st_transform(potato_val_NDRE, 4326)
potato_val_NDRE <- st_zm(potato_val_NDRE, drop = T, what = "ZM")

#create leaflet of NDVI
#pal <-  colorBin(palette = "RdYlGn", domain = corn_mon_NDVI)

leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  addRasterImage(x=s2_images_NDVI[[16]], colors = "RdYlGn", opacity = 0.8, group="NDVI raster") %>%
  #addLegend("bottomright", pal=pal, values= s2_images_NDVI[[1]]@data@values, title = "NDVItitle", opacity= 1) %>%
  addLayersControl( 
    overlayGroups = c("NDVI raster", "Corn_mon", "Corn_val", "Potato_mon", "Potato_val"),
    options = layersControlOptions(collapsed = FALSE)) %>%
  addScaleBar(position = "bottomleft") %>%
  addPolygons(data = corn_mon_NDVI, color = "green") %>%
  addPolygons(data = corn_val_NDVI, color = "steelblue4") %>%
  addPolygons(data = potato_mon_NDVI, color = "yellow1") %>%
  addPolygons(data = potato_val_NDVI, color = "yellow4")





