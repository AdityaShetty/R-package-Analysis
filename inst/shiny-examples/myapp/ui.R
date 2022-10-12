#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

require(readxl)
require(shiny)
require(ggplot2)
require(shinyWidgets)
require(bslib)
require(ggiraph)


# Define UI for application that draws a histogram
ui <- fluidPage(
  #Changing theme
  theme = bs_theme(version = 4, bootswatch = "minty"),
  #Changing background color
  setBackgroundColor("#B1D4E0"),
  tabsetPanel(
    tabPanel("App Summary",
             verbatimTextOutput("summary"),
             imageOutput("image")
    ),

    tabPanel("Interactive App",
             # Application title
             titlePanel("Student Maths scores based on parameters"),

             # Sidebar with a slider input for number of bins
             sidebarLayout(
               sidebarPanel(

                 radioButtons("Type_plot", "Type of plot",
                              choices = list("Summarise Data" = 1, "Summarise Model" = 2),selected = 1)




               ),

               # Show a plot of the generated distribution
               mainPanel(
                 plotOutput("distPlot"),
                 textOutput("text")

               )
             )
    ),
    #Extra tab about student info
    tabPanel("Aboutme",
             verbatimTextOutput("Aboutme")
    )


  )
)

