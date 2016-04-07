library(shiny)
source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
output$map1<-renderPlot({
args <- switch(input$select,
        "Percent White" = list(counties$white, "darkgreen", "% White"),
        "Percent Black" = list(counties$black, "black", "% Black"),
        "Percent Hispanic" = list(counties$hispanic, "darkorange", "% Hispanic"),
        "Percent Asian" = list(counties$asian, "darkviolet", "% Asian"))
        
      args$min <- input$bins[1]
      args$max <- input$bins[2]
  
      do.call(percent_map, args)
})
})
