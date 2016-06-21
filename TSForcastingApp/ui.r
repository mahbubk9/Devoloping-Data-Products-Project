

library(shiny)
library(googleVis)
library(rCharts)
library(markdown)
library(quantmod)
# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title.
  titlePanel("Time Series Forecasting"),
  
  #The sidebar code
  sidebarLayout(
    sidebarPanel(
      selectInput("tseries", h5("Choose a Company Time Series:"), 
                  choices = c("TWTR", "FB", "AAPL" )),
      helpText("Please select TWTR for Twitter.",
               " FB for Facebook ",
               " OR AAPL for Apple."),
      
      dateInput("datfrm", label = h5("Date From"), value = "2010-01-01"),
      
      dateInput("datto", label = h5("Date To"), value = "2016-01-01"),
      
     
      
      selectInput("tmframe", h5("Choose a Time Frame:"), 
                  choices = c( "quarterly","monthly" )),
      
      
      submitButton("Update View")
    ),
    
   #The mainpanel code with tabspanel code inside
    mainPanel(
               tabsetPanel(type = "tabs", 
 
               tabPanel("Time Series", h4( ' Time Series'),showOutput("rChart","morris")),
               
                
                tabPanel("Decomposition",   plotOutput("decomts")),
                
                
                tabPanel("Forecast",plotOutput("fcast")),
               
                 tabPanel("Help", includeMarkdown("help.md"))
               )  
     
))))

