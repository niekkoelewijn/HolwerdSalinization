# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

#create leaflet maps

#NDVI leaflet map

##

corn_mon_NDVI <- Corn_plots_NDVI[1:4,(1+3)]
corn_val_NDVI <- Corn_plots_NDVI[5:8,(1+3)]
potato_mon_NDVI <- Potato_plots_NDVI[1:4,(1+3)]
potato_val_NDVI <- Potato_plots_NDVI[5:8,(1+3)]

corn_mon_NDRE <- Corn_plots_NDRE[1:4,(1+3)]
corn_val_NDRE <- Corn_plots_NDRE[5:8,(1+3)]
potato_mon_NDRE <- Potato_plots_NDRE[1:4,(1+3)]
potato_val_NDRE <- Potato_plots_NDRE[5:8,(1+3)]

#create leaflet of NDVI
#pal <-  colorBin(palette = "RdYlGn", domain = corn_mon_NDVI)

leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  addRasterImage(x=s2_images_NDVI[[1]], colors = "RdYlGn", opacity = 0.8, group="NDVI raster") %>%
  #addLegend("bottomright", pal=pal, values= s2_images_NDVI[[1]]@data@values, title = "NDVItitle", opacity= 1) %>%
  #addLayersControl( 
    #overlayGroups = c("NDVI raster", "Corn_mon", "Corn_val", "Potato_mon", "Potato_val"),
    #options = layersControlOptions(collapsed = FALSE)) %>%
  addScaleBar(position = "bottomleft") %>%
  addPolygons(data = st_zm(corn_mon_NDVI), color="Black", weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5, fillColor = ~colorQuantile("YlOrRd", corn_mon_NDVI)(corn_mon_NDVI))

leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(data = corn_mon_NDVI, color="Black", weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5)

  

