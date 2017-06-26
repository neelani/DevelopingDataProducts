#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Wine Quality Cluster Analysis"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("clusters",
                   "No of Clusters:",
                   min = 1,
                   max = 8,
                   value = 2),
       checkboxInput("fixed.acidity",
                   "Fixed Acidity:",
                   value = TRUE),
       checkboxInput("volatile.acidity",
                     "Volatile Acidity",
                     value = TRUE),
       checkboxInput("citric.acid",
                     "Citric Acid",
                     value = TRUE),
       checkboxInput("residual.sugar",
                     "Residual Sugar",
                     value = TRUE),
       checkboxInput("chlorides",
                     "Chlorides",
                     value = TRUE),
       checkboxInput("density",
                     "Density",
                     value = TRUE),
       checkboxInput("pH",
                     "pH",
                     value = TRUE),
       checkboxInput("sulphates",
                     "Suplphates",
                     value = TRUE),
       checkboxInput("alcohol",
                     "Alcohol",
                     value = TRUE),
       submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("disPlot")
    )
  )
))
