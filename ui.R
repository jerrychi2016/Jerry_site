library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("cencusVis"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
p("Create demographic maps with information from the 2010 US Census."),
selectInput("select",label=h5("Choose a variable to display"),choices=list("Percent White","Percent Black","Percent Hispanic","Percent Asian"),selected="Percent White"),
sliderInput("bins",
"Percent  of interest:",
min=0,
max=100,
value=c(0,100))
          ),

    # Show a plot of the generated distribution
    mainPanel(
textOutput("text1"),
textOutput("text2"),
plotOutput("map1")
          )
  )
))
