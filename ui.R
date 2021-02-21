library(shiny)
library(ggplot2)

fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
        information from the 2010 US Census."),
      
      selectInput("var", 
                  label = "Choose a gene module to display",
                  choices = (1:22),
                  selected = 1)),
    
    mainPanel(
      plotOutput("plot1")
    )
  )
)
