require(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Hospital Inpatient Prevention Quality Indicators for Adults by zipcode from 2009-2012 in New York State"),
  sidebarPanel(
    sliderInput("Year", "Select a year to be displayed:", 
                min=2009, max=2012, value=2012,  step=1,
                format="###0",animate=TRUE),
    
    selectInput("Disease", "Select a type of disease:", 
                choices = disease_list),
    
    selectInput("Zipcode", "Select a zipcode:",
                choices = zipcode_list),
    
    plotOutput("RateYear", height = "300px"),
    
    htmlOutput("ObsRateDisease")
  ),
    
  mainPanel(
    h3(textOutput("year")), 
    htmlOutput("gvis"),
    htmlOutput("ExpRateDisease")
  )
)
)