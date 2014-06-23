require(googleVis)
require(shiny)



shinyServer(function(input, output) {
  
  Year <- reactive({
    input$Year
  })
  
  Disease <- reactive({
    input$Disease
  })
  
  Zipcode <- reactive({
    input$Zipcode
  })
  
  
  
  output$gvis <- renderGvis({
    
    
    my_dat <- subset(dat, 
                     (year == Year()) & (disease == Disease()))
    
    gvisGeoChart(my_dat, locationvar='longlat', colorvar='obs_rate',
                 hovervar = "zip_code",
                 options=list(region='US-NY', resolution = "metros",
                              width = 850, height=670, 
                              displayMode='markers', 
                              colorAxis = "{values:[0, 100, 200, 500, 800, 1000, 1200],
                              colors:[\'DarkBlue', \'Teal', \'DarkGreen', \'Gold', \'OrangeRed', \'DeepPink', \'Red']}")
    )    
  })
  
  output$RateYear <- renderPlot({
    
    rate_year <- subset(dat,
                        (zip_code == Zipcode()) & (disease == Disease()))
   
    max_y <- max(rate_year$obs_rate, rate_year$exp_rate)
    min_y <- min(rate_year$obs_rate, rate_year$exp_rate)
    yrange <- c(min_y, max_y)
    
    plot(c(2009, 2012),  yrange, xaxt = "n",   xlab = "Year", ylab = "Rate per 100,000 people", type = "n")
    axis(1, at = 2009:2012, label = c("2009", "2010", "2011", "2012"))
    
    lines(2009:2012, rate_year$obs_rate, col = "red")
    lines(2009:2012, rate_year$exp_rate, col = "blue")
    
    legend("topright", c("observed","expected"), fill = c("red","blue"))
    
    Disease_name <- as.character(Disease()) 
    if (nchar(Disease_name) > 45) 
       {Disease_name <- paste(substr(Disease_name, 1, 45), "\n -", 
                              substr(Disease_name, 46, nchar(Disease_name)))}
    title(paste(Disease_name, "\n", "at district", Zipcode()), ps = 0.5)
  })
  
  output$ObsRateDisease <- renderGvis({
    Rate_dis <- subset(dat,
                       (zip_code == Zipcode()) & (year == Year()))
    obs_rd <- data.frame(Rate_dis$disease, Rate_dis$obs_rate)
    gvisPieChart(obs_rd, labelvar = obs_rd$disease, 
                 options = list(width = 500, is3D = TRUE, 
                                title = paste("Relative Observe Rate at", Zipcode(),
                                              "in", Year())))
  })
  
  output$ExpRateDisease <- renderGvis({
    Rate_dis <- subset(dat,
                       (zip_code == Zipcode()) & (year == Year()))
    exp_rd <- data.frame(Rate_dis$disease, Rate_dis$exp_rate)
    gvisPieChart(exp_rd, labelvar = exp_rd$disease, 
                 options = list(width = 500, is3D = TRUE,
                                title = paste("Relative Expected Rate at", Zipcode(),
                                              "in", Year())))
  })
  
})