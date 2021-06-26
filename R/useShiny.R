# Project Holwerd Salinization
# RS and GIS integration
# Wageningen University
# Group 5
# Date: june 2021
# License: GNU General Public License version 3.0

# create a Shiny application 

if(!"shiny" %in% rownames(installed.packages())){install.packages("shiny")}
if(!"leaflet" %in% rownames(installed.packages())){install.packages("leaflet")}

library(shiny)
library(leaflet)

ui <- fluidPage(br(),
                
                
                #Create the title panel & asign theme
                titlePanel(strong("Holwerd aan Zee salinization monitoring baseline analysis 2019")), br(), br(),
                theme = shinytheme("superhero"),
                
                #create layout of the application: side bar layout
                sidebarLayout(
                  
                  #side bar consists of a dropdown menu for NDVI/NDRE and a slide bar throughout the year
                  sidebarPanel(
                    selectInput('Composite', 'Select composite RGB, FCC or Red edge (for Study Area tab)', choices = c("RGB", "FCC", "Red edge"), selected = "RGB"),
                    selectInput('Index', 'Select the NDVI or NDRE index (for Monitor tabs)', choices = c("NDVI", "NDRE"), selected = "NDVI"),
                    sliderInput(
                      'Image','Select a date',
                      1, 16, 1),
                    textOutput("Date")),
                  
                  #create the main layout with different tabs
                  mainPanel(
                    tabsetPanel(type='tabs',
                                tabPanel('Information', textOutput('info'),
                                         br(), h4('Project team'),
                                         (
                                           "This project was part of the Remote Sensing and GIS integration course of the Wageningen University MGI master program. The commissioner for this project was Wiertsema & Partners."), br(), br(),
                                         (
                                           "Louisa Heilinger, Niek Koelewijn, Marlot van Balveren, Jan Hooijmans & Thijs Koop"), br(),
                                         (
                                           "29 June 2021"),
                                         
                                         h4('Introduction'),
                                         (
                                           "Hello!  Welcome to the 'Holwerd aan Zee' salinization monitoring' application to detect salinization in Holwerd (Friesland)."), 
                                         br(), 
                                         (
                                          "In this app you can find:  The study area Holwerd. The study area can be observed in RGB, False color composite (FCC) and Red Edge.  The monitoring maps that have been created are presented. Also, monitoring graphs showing the development of Normalized Difference Vegetation Index (NDVI) and Normalized Difference Red Edge Index (NDRE) indices over time for different crops with medium and deep rooting systems (Potato and Corn respectively)."),
                                         
                                         br(), h4('Data'),
                                         (
                                           "The data that was used for creating this salinization application includes freely available Sentinal-2 data. Specific bands that were used include bands 2, 3 and 4 (Blue, Green and Red at 10m resolution), band 5 (Red Edge at 20m resolution) and band 8 (NIR) at 10m resolution). Copy the link below to find the used GEE script for extracting the data in the HolwerdSalinization folder"),
                                         a(
                                           "https://code.earthengine.google.com/?accept_repo=users/niekkoelewijn/geoscripting"),
                                         br(), h4('Methodology'),
                                         (
                                           "This application was made through the use of the R Shiny package, which enables the user to create web apps. The following steps were conducted to process the data:"), br(), br(),
                                         (
                                           "1.	Draw study area and agricultural plots (monitor and validation) in Google Earth Engine"), br(),
                                         (
                                           "2.	Load polygons into R script and download Sentinal-2 data clipped to study area"), br(),
                                         (
                                           "3.	Calculate NDVI and NDRE values of each agricultural plot and plot development over time into graphs, for both the monitor and validation fields "), br(),
                                         (
                                           "4.	If NDRE values on monitor fields become low, which is not the case on validation fields, it is likely that stress is detected due to salinization in future situations when the tidal lake is established. NDVI must be checked however if this decline in NDRE is not due to biomass loss (for instance, harvesting).  "), br(),
                                         (
                                           "5.	If a decrease in NDRE is not related to harvesting, then in-situ measurements can take place in order to further investigate the salinization process (monitoring wells)"), br(),
                                         
                                         
                                         ),
                                
                                tabPanel('Study Area', br(), strong(textOutput('titleStudyArea'), align="center"), br(), plotOutput('studyarea')),
                                tabPanel('Monitor Maps', br(), strong(textOutput('titleMaps'), align="center"), br(), leafletOutput('maps')),
                                tabPanel('Monitor Corn Graphs', br(), strong(textOutput('titleCornGraphs'), align="center"), br(), plotOutput('corngraphs')),
                                tabPanel('Monitor Potato Graphs', br(), strong(textOutput('titlePotatoGraphs'), align="center"), br(), plotOutput('potatographs')))
                  )
                )
)

server <- function(input, output, session) {
  
    
  
  output$Date <- renderText({
    paste('Date:', 
          substr(s2_images_names[input$Image], 4,13))
  })
  
  output$titleStudyArea <- renderText({paste('Satellite band composites Holwerd aan Zee', substr(s2_images_names[input$Image], 4,13))})

  output$studyarea <- renderPlot({
    if (input$Composite == 'RGB'){
      plotRGB(s2_images_cloudfree[[input$Image]], 3,2,1, scale = 5000, stretch = "lin")
    }
    else if (input$Composite == 'FCC'){
      plotRGB(s2_images_cloudfree[[input$Image]], 5,3,2, scale = 5000, stretch = "lin")
    }
    else if (input$Composite == 'Red edge'){
      plotRGB(s2_images_cloudfree[[input$Image]], 4,3,2, scale = 5000, stretch = "lin")
    }
  })
  
  output$titleMaps <- renderText({paste('Interactive map vegetation indices and plot locations', substr(s2_images_names[input$Image], 4,13))})

  output$maps <- renderLeaflet({
    
    if (input$Index == 'NDVI'){
      pal <-  colorBin(palette = "RdYlGn", domain = s2_images_NDVI[[input$Image]]@data@values)
      
      leaflet() %>%
        addProviderTiles("CartoDB.Positron") %>%
        addRasterImage(x=s2_images_NDVI[[input$Image]], colors = "RdYlGn", opacity = 0.8, group="NDVI raster") %>%
        addLegend("bottomright", pal = pal, values= s2_images_NDVI[[input$Image]]@data@values, title = "NDVI", opacity= 1) %>%
        addLayersControl( 
          overlayGroups = c("NDVI raster", "Corn_mon", "Corn_val", "Potato_mon", "Potato_val"),
          options = layersControlOptions(collapsed = FALSE)) %>%
        addScaleBar(position = "bottomleft") %>%
        addPolygons(data = corn_mon_NDVI, color = "#cb9c10", weight = 1, smoothFactor = 0.5,
                    opacity = 1.0, fillOpacity = 0.5, group = "Corn_mon",
                    highlightOptions = highlightOptions(color = "white", weight = 2, bringToFront = TRUE),
                    label = sprintf(fmt = "<strong>%s</strong>", "Corn monitoring")%>% lapply(htmltools::HTML)) %>%
        addPolygons(data = corn_val_NDVI, color = "#9c780d", weight = 1, smoothFactor = 0.5,
                    opacity = 1.0, fillOpacity = 0.5, group = "Corn_val",
                    highlightOptions = highlightOptions(color = "white", weight = 2, bringToFront = TRUE),
                    label = sprintf(fmt = "<strong>%s</strong>", "Corn validation")%>% lapply(htmltools::HTML)) %>%
        addPolygons(data = potato_mon_NDVI, color = "#974b0c", weight = 1, smoothFactor = 0.5,
                    opacity = 1.0, fillOpacity = 0.5, group = "Potato_mon",
                    highlightOptions = highlightOptions(color = "white", weight = 2, bringToFront = TRUE),
                    label = sprintf(fmt = "<strong>%s</strong>", "Potato monitoring")%>% lapply(htmltools::HTML)) %>%
        addPolygons(data = potato_val_NDVI, color = "#552a07", weight = 1, smoothFactor = 0.5,
                    opacity = 1.0, fillOpacity = 0.5, group = "Potato_val",
                    highlightOptions = highlightOptions(color = "white", weight = 2, bringToFront = TRUE),
                    label = sprintf(fmt = "<strong>%s</strong>", "Potato validation")%>% lapply(htmltools::HTML))
    }
    
    else if (input$Index == 'NDRE'){
      pal <-  colorBin(palette = "RdYlGn", domain = s2_images_NDRE[[input$Image]]@data@values)
      
      leaflet() %>%
        addProviderTiles("CartoDB.Positron") %>%
        addRasterImage(x=s2_images_NDRE[[input$Image]], colors = "RdYlGn", opacity = 0.8, group="NDRE raster") %>%
        addLegend("bottomright", pal = pal, values= s2_images_NDRE[[input$Image]]@data@values, title = "NDRE", opacity= 1) %>%
        addLayersControl( 
          overlayGroups = c("NDRE raster", "Corn_mon", "Corn_val", "Potato_mon", "Potato_val"),
          options = layersControlOptions(collapsed = FALSE)) %>%
        addScaleBar(position = "bottomleft") %>%
        addPolygons(data = corn_mon_NDRE, color = "#cb9c10", weight = 1, smoothFactor = 0.5,
                    opacity = 1.0, fillOpacity = 0.5, group = "Corn_mon",
                    highlightOptions = highlightOptions(color = "white", weight = 2, bringToFront = TRUE),
                    label = sprintf(fmt = "<strong>%s</strong>", "Corn monitoring")%>% lapply(htmltools::HTML)) %>%
        addPolygons(data = corn_val_NDRE, color = "#9c780d", weight = 1, smoothFactor = 0.5,
                    opacity = 1.0, fillOpacity = 0.5, group = "Corn_val",
                    highlightOptions = highlightOptions(color = "white", weight = 2, bringToFront = TRUE),
                    label = sprintf(fmt = "<strong>%s</strong>", "Corn validation")%>% lapply(htmltools::HTML)) %>%
        addPolygons(data = potato_mon_NDRE, color = "#974b0c", weight = 1, smoothFactor = 0.5,
                    opacity = 1.0, fillOpacity = 0.5, group = "Potato_mon",
                    highlightOptions = highlightOptions(color = "white", weight = 2, bringToFront = TRUE),
                    label = sprintf(fmt = "<strong>%s</strong>", "Potato monitoring")%>% lapply(htmltools::HTML)) %>%
        addPolygons(data = potato_val_NDRE, color = "#552a07", weight = 1, smoothFactor = 0.5,
                    opacity = 1.0, fillOpacity = 0.5, group = "Potato_val",
                    highlightOptions = highlightOptions(color = "white", weight = 2, bringToFront = TRUE),
                    label = sprintf(fmt = "<strong>%s</strong>", "Potato validation")%>% lapply(htmltools::HTML))
    }
      
  })

  output$titleCornGraphs <- renderText({paste('Monitoring CORN graph of vegetation index over the year')})
    
  output$corngraphs <- renderPlot({
    if (input$Index == 'NDVI'){
      ggplot() +
        geom_line(data = Corn_NDVI_means, aes(Date, monitoring, color="Monitoring"), size=1)+
        geom_line(data = Corn_NDVI_means, aes(Date, validation, color="Validation"), size=1)+
        scale_color_manual(values=c("steelblue1","steelblue4"))+
        geom_point(data = Corn_NDVI_means, aes(y=monitoring, x=Date))+
        geom_point(data = Corn_NDVI_means, aes(y=validation, x=Date))+
        ylab("Mean NDVI")+
        xlab("2019")+
        ggtitle("Timeseries of the mean NDVI of corn plots")+
        scale_x_continuous(breaks = round(seq(min(Corn_NDVI_means$Date), max(Corn_NDVI_means$Date), by = 62),1),
                           labels = c("19 March", "20 May", "21 July", "21 September", "22 November"))+
        theme_minimal()+
        theme(plot.title = element_text(hjust = 0.5))
    }
    
    else if (input$Index == 'NDRE'){
      ggplot() +
        geom_line(data = Corn_NDRE_means, aes(Date, monitoring, color="Monitoring"), size=1)+
        geom_line(data = Corn_NDRE_means, aes(Date, validation, color="Validation"), size=1)+
        scale_color_manual(values=c("steelblue1","steelblue4"))+
        geom_point(data = Corn_NDRE_means, aes(y=monitoring, x=Date))+
        geom_point(data = Corn_NDRE_means, aes(y=validation, x=Date))+
        ylab("Mean NDRE")+
        xlab("2019")+
        ggtitle("Timeseries of the mean NDRE of corn plots")+
        scale_x_continuous(breaks = round(seq(min(Corn_NDRE_means$Date), max(Corn_NDRE_means$Date), by = 62),1),
                           labels = c("19 March", "20 May", "21 July", "21 September", "22 November"))+
        theme_minimal()+
        theme(plot.title = element_text(hjust = 0.5))
    }
  })
  
  output$titlePotatoGraphs <- renderText({paste('Monitoring POTATO graph of vegetation index over the year')})
  
  output$potatographs <- renderPlot({
    if (input$Index == 'NDVI'){
      ggplot() +
        geom_line(data = Potato_NDVI_means, aes(Date, monitoring, color="Monitoring"), size=1)+
        geom_line(data = Potato_NDVI_means, aes(Date, validation, color="Validation"), size=1)+
        scale_color_manual(values=c("steelblue1","steelblue4"))+
        geom_point(data = Potato_NDVI_means, aes(y=monitoring, x=Date))+
        geom_point(data = Potato_NDVI_means, aes(y=validation, x=Date))+
        ylab("Mean NDVI")+
        xlab("2019")+
        ggtitle("Timeseries of the mean NDVI of Potato plots")+
        scale_x_continuous(breaks = round(seq(min(Potato_NDVI_means$Date), max(Potato_NDVI_means$Date), by = 62),1),
                           labels = c("19 March", "20 May", "21 July", "21 September", "22 November"))+
        theme_minimal()+
        theme(plot.title = element_text(hjust = 0.5))
    }
    
    else if (input$Index == 'NDRE'){
      ggplot() +
        geom_line(data = Potato_NDRE_means, aes(Date, monitoring, color="Monitoring"), size=1)+
        geom_line(data = Potato_NDRE_means, aes(Date, validation, color="Validation"), size=1)+
        scale_color_manual(values=c("steelblue1","steelblue4"))+
        geom_point(data = Potato_NDRE_means, aes(y=monitoring, x=Date))+
        geom_point(data = Potato_NDRE_means, aes(y=validation, x=Date))+
        ylab("Mean NDRE")+
        xlab("2019")+
        ggtitle("Timeseries of the mean NDRE of Potato plots")+
        scale_x_continuous(breaks = round(seq(min(Potato_NDRE_means$Date), max(Potato_NDRE_means$Date), by = 62),1),
                           labels = c("19 March", "20 May", "21 July", "21 September", "22 November"))+
        theme_minimal()+
        theme(plot.title = element_text(hjust = 0.5))
    }
  })
}

