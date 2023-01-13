#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to plot line graph and scatter plot
shinyServer(function(input, output) {

    output$UIoverTimePlot <- renderPlot({

      ggplot(UnemploymentInflationRDS, aes(x = lubridate::as_date(date))) + 
        geom_line(aes(y = unemployment_rate), color = "blue", linewidth=0.8) + geom_line(aes(y = inflation_rate), color = "orange", linewidth=0.8) + theme_bw() + ggtitle("Unemployment (blue) vs. Inflation (orange) 1960 - Present") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Date") + ylab("Unemployment %,  Inflation (PCEPI) %")

    })
    output$UIScatterPlot <- renderPlot({
      
      ggplot(UnemploymentInflationRDS, aes(x=unemployment_rate, y=inflation_rate)) + geom_point(pch=16, cex=2) + geom_smooth(method=lm, se=FALSE) + geom_point(color = "orange") + theme_bw() + ggtitle("Unemployment vs. Inflation, 1960 - Present") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Unemployment Rate (%)") + ylab("Inflation Rate (PCEPI, %)")
      
      
    })
})
