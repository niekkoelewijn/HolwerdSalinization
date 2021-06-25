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
                                         h4('Introduction'),
                                         (
                                           "some introduction text"), 
                                         br(), br(), h4('Data'),
                                         (
                                           "some text about the data that was used"),
                                         a(
                                           "https://code.earthengine.google.com/?accept_repo=users/niekkoelewijn/geoscripting"),
                                         br(), br(), h4('Methodology'),
                                         (
                                           "some text about the methodology "), br(), br(),
                                         (
                                           "1. step 1"), br(),
                                         (
                                           "2. step 2)"), br(),
                                         (
                                           "3. step 3"), br(),
                                         (
                                           "4. step 4"), br(),
                                         (
                                           "5. step 5"), br(),
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
  
  output$titleMaps <- renderText({paste('Monitoring leaflet map for monitoring fields', substr(s2_images_names[input$Image], 4,13))})

  output$maps <- renderLeaflet({
    
    if (input$Index == 'NDVI'){
      #leaflet
    }
    
    else if (input$Index == 'NDRE'){
      #leaflet
    }
      
  })

  output$titleCornGraphs <- renderText({paste('Monitoring CORN graph of index over the year')})
    
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
  
  output$titlePotatoGraphs <- renderText({paste('Monitoring POTATO graph of index over the year')})
  
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

