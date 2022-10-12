#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
require(Analysis)
require("ggiraphExtra")
require(readxl)
require(shiny)
require(ggplot2)
require("rstudioapi")
require(shinyWidgets)
require(bslib)
require(ggpubr)

path = system.file("extdata","Maths_ED.xlsx", package = "Analysis")
ds = Analysis::MathsData(path)



server <- function(input, output) {

  output$distPlot <- renderPlot({



    # Residual plots
    if(input$Type_plot == 2) {
      model = Analysis::fitall(ds,"summarise_model")
      Analysis::plotR(model)
    }
    # Boxplots
    if(input$Type_plot == 1) {

      model = Analysis::fitall(ds,"summarise_data")
      Analysis::plotR(model)
    }

  })










  output$summary<- renderText({paste("This app is interactive report on Maths data scores based on",
                                     " parameters of a class given.",
                                     "In this app we plot summary of the model and data",
                                     "Go to the next tab to view the app"
                                     ,sep="\n")})



  output$Aboutme <- renderText({paste("Student Name: Aditya Shetty",
                                      "Student id : 21200138",
                                      "UCD - Msc. Data & Computational Sciene", sep="\n")})





}

