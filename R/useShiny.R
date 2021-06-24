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
                titlePanel(strong("Holwerd aan Zee salinization monitoring in 2019")), br(), br(),
                sidebarLayout(
                  sidebarPanel(
                    selectInput('Index', 'Select the NDVI or NDRE index', choices = c("NDVI", "NDRE")),
                    sliderInput(
                      'Image','Select a date',
                      1, 16, 1),
                    textOutput("Date")),
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
                                
                                tabPanel('Satellite', br(), strong(textOutput('titleSat'), align="center"), br(), plotOutput('satellite')),
                                tabPanel('Maps', br(), strong(textOutput('titleMaps'), align="center"), br(), plotOutput('maps')),
                                tabPanel('Graphs', br(), strong(textOutput('titleGraphs'), align="center"), br(), plotOutput('graphs')))
                  )
                )
)

server <- function(input, output, session) {
  
  output$Date <- renderText({
    paste('Date:', 
          substr(s2_images_names[input$Image], 4,13))
  })
  
  output$titleSat <- renderText({paste('Satellite image Holwerd aan Zee', substr(s2_images_names[input$Image], 4,13))})
  
  output$satellite <- renderPlot({
    plotRGB(s2_images_cloudfree[[input$Image]], 3,2,1, scale = 5000, stretch = "lin")
  })
  
  output$titleMaps <- renderText({paste('Satellite image Holwerd aan Zee', substr(s2_images_names[input$Image], 4,13))})
  
  output$maps <- renderPlot({
    if (input$Index == 'NDVI'){
      plotRGB(s2_images_cloudfree[[input$Image]], 5,4,3, scale = 5000, stretch = "lin")
    }
    if (input$Index == 'NDRE'){
      plotRGB(s2_images_cloudfree[[input$Image]], 5,3,2, scale = 5000, stretch = "lin")
    } 

  })
  
}

shinyApp(ui = ui, server = server)
