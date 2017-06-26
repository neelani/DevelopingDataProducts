#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  wine <- read.csv("winequality-red.csv", header=TRUE, sep=";")
  
  no_cl <- 2
  x1 <- TRUE
  x2 <- TRUE
  x3 <- TRUE
  x4 <- TRUE
  x5 <- TRUE
  x6 <- FALSE
  x7 <- FALSE
  x8 <- TRUE
  x9 <- TRUE
  x10 <- TRUE
  x11 <- TRUE
  x12 <- FALSE

  colsel <- c(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12)
  
  wine_sel <- wine[, colsel]
  
  r_no_of_cl_sel <- reactive({
    return(input$clusters)
  })
  
  r_data_sel <- reactive({
 
    x1 <- input$fixed.acidity
    x2 <- input$volatile.acidity
    x3 <- input$citric.acid
    x4 <- input$residual.sugar
    x5 <- input$chlorides
    x6 <- FALSE
    x7 <- FALSE
    x8 <- input$density
    x9 <- input$pH
    x10 <- input$sulphates
    x11 <- input$alcohol
    x12 <- FALSE
    
    colsel <- c(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12)
    wine_sel <- wine[, colsel]
    
    return(wine_sel)

  })
   
  output$disPlot <- renderPlot({
 
    data <- r_data_sel()

    set.seed(1234)
    cl<-kmeans(data,  r_no_of_cl_sel())
    
    # Plot Cluster Means 
    plot(data, col=cl$cluster)
    
  })
 
})
