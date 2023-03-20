
library(shiny)

# Define server logic required to produce scatter plots and line graphs for comparison and analysis
shinyServer(function(input, output) {
  
  output$UIScatterPlot <- renderPlot({
    
    datecutoff <- datelist[[input$select]]
    ggplot(UnemploymentInflationRDS[which(UnemploymentInflationRDS$date>= datecutoff[1] & UnemploymentInflationRDS$date<=datecutoff[2]),], aes(x=unemployment_rate, y=inflation_rate)) + geom_point(pch=16, cex=2) + geom_smooth(method="lm", formula = "y ~ log(x)", se=FALSE) + geom_point(color = "orange") + theme_bw() + ggtitle("Unemployment vs. Inflation, 1960 - Present: Relatively Flat Phillips Curve") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Unemployment Rate (%)") + ylab("Inflation Rate (PCEPI) %")
    
  })
  output$UIoverTimePlot <- renderPlot({
    
    datecutoff <- datelist[[input$select]]
    ggplot(UnemploymentInflationRDS[which(UnemploymentInflationRDS$date>= datecutoff[1] & UnemploymentInflationRDS$date<=datecutoff[2]),], aes(x = lubridate::as_date(date))) + 
      geom_line(aes(y = unemployment_rate), color = "blue", linewidth=0.8) + geom_line(aes(y = inflation_rate), color = "orange", linewidth=0.8) + theme_bw() + ggtitle("Unemployment (blue) & Inflation (orange) Lines Should Move in Opposite Direction if Phillips True") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Date") + ylab("Unemployment %,  Inflation (PCEPI) %")
    
  })
  output$UIsince83Plot <- renderPlot({
    ggplot(UnemploymentInflationRDS[which(UnemploymentInflationRDS$date>="1983-01-01" & UnemploymentInflationRDS$date<="2022-07-01"),], aes(x=unemployment_rate, y=inflation_rate)) + geom_point(pch=16, cex=2) + geom_smooth(method=lm, se=FALSE) + geom_point(color = "orange") + theme_bw() + ggtitle("FOMC Sucessfully Targets Low Inflation Since 1983, Producing Strikingly Flat Phillips Curve") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Unemployment Rate (%)") + ylab("Inflation Rate (PCEPI) %") 
    
  }) 
  output$UIrecessionsPlot <- renderPlot({
    ggplot(UnemploymentInflationRDS, aes(x = lubridate::as_date(date)))+ 
      geom_line(aes(y = unemployment_rate), color = "blue", linewidth=0.8) + geom_line(aes(y = inflation_rate), color = "orange", linewidth=0.8) + geom_rect(data=recessionRDS, aes(x=NULL, y=NULL, xmin=lubridate::as_date(Peak), xmax=lubridate::as_date(Trough), ymin=-Inf, ymax=+Inf), alpha=0.2) + theme_bw() + ggtitle("Phillips Theory True During Recessions: Unemployment (blue), Inflation (orange), Recessions (grey)") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Date") + ylab("Unemployment %, Inflation (PCEPI) %")
  })  
  
}) 
