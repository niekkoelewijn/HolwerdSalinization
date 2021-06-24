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
                                tabPanel('Monitor Maps', br(), strong(textOutput('titleMaps'), align="center"), br(), plotOutput('maps')),
                                tabPanel('Monitor Graphs', br(), strong(textOutput('titleGraphs'), align="center"), br(), plotOutput('graphs')))
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

  output$maps <- renderPlot({
    if (input$Index == 'NDVI'){
      plotRGB(s2_images_cloudfree[[input$Image]], 5,4,3, scale = 5000, stretch = "lin")
    }
    if (input$Index == 'NDRE'){
      plotRGB(s2_images_cloudfree[[input$Image]], 5,3,2, scale = 5000, stretch = "lin")
    }
  })
  
  output$titleGraphs <- renderText({paste('Monitoring graph of index over the year')})
    
  output$graphs <- renderPlot({
    if (input$Index == 'NDVI'){
      plotRGB(s2_images_cloudfree[[input$Image]], 5,4,3, scale = 5000, stretch = "lin")
    }
    if (input$Index == 'NDRE'){
      plotRGB(s2_images_cloudfree[[input$Image]], 5,3,2, scale = 5000, stretch = "lin")
    }
  })
}

shinyApp(ui = ui, server = server)

#test

