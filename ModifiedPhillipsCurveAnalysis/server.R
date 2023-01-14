
library(shiny)

# Define server logic required to plot line graph and scatter plot
shinyServer(function(input, output) {

    output$UIScatterPlot <- renderPlot({

      datecutoff <- datelist[[input$select]]
      ggplot(UnemploymentInflationRDS[which(UnemploymentInflationRDS$date>= datecutoff[1] & UnemploymentInflationRDS$date<=datecutoff[2]),], aes(x=unemployment_rate, y=inflation_rate)) + geom_point(pch=16, cex=2) + geom_smooth(method=lm, se=FALSE) + geom_point(color = "orange") + theme_bw() + ggtitle("Unemployment vs. Inflation") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Unemployment Rate (%)") + ylab("Inflation Rate (PCEPI, %)")
      
    })
    output$UIoverTimePlot <- renderPlot({
      
      datecutoff <- datelist[[input$select]]
      ggplot(UnemploymentInflationRDS[which(UnemploymentInflationRDS$date>= datecutoff[1] & UnemploymentInflationRDS$date<=datecutoff[2]),], aes(x = lubridate::as_date(date))) + 
        geom_line(aes(y = unemployment_rate), color = "blue", linewidth=0.8) + geom_line(aes(y = inflation_rate), color = "orange", linewidth=0.8) + theme_bw() + ggtitle("Unemployment (blue) vs. Inflation (orange)") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Date") + ylab("Unemployment %,  Inflation (PCEPI) %")
      
      
      
    })
}) 
