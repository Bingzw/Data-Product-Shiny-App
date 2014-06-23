require(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Hospital Inpatient Prevention Quality Indicators for Adults by zipcode from 2009-2012 in New York State"),
  sidebarPanel(
    helpText("Instruction:"),
    helpText("Choose year and disease, see main panel"),
    helpText("Choose disease and zipcode, see left side panel"),
    helpText("Choose year and zipcode, see pie down below them"),
    
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
     
    htmlOutput("gvis"),
    htmlOutput("ExpRateDisease")
  )
)
)