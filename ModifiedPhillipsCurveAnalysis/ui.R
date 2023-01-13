#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Unemployment vs Inflation - Modified Phillips Curve Analysis"),

    # Sidebar with a selection box for timeframe desired
    sidebarLayout(
        sidebarPanel(
          selectInput("select", label = h3("Select Timeframe"), 
                      choices = list("Since 1960" = 1, "1960's" = 2, "1970's" = 3,
                                     "1980's" = 4, "1990's" = 5, "2000's" = 6,
                                     "2010 - Present" = 7,"1960 -1964" = 8, 
                                     "1965 - 1969" = 9, "1970 - 1974" = 10, 
                                     "1975 - 1979" = 11, 
                                     "1980 - 1984" = 12, "1985 - 1989" = 13,
                                     "1990 - 1994" = 14, "1995 - 1999" = 15,
                                     "2000 - 2004" = 16, "2005 - 2009" = 17,
                                     "2010 - 2014" = 18, "2015 - Present" = 19,
                                     "1960 - 1962" = 20,
                                     "1963 - 1965" = 21, "1966 - 1968" = 22,
                                     "1969 - 1971" = 23, "1972 - 1974" = 24,
                                     "1975 - 1977" = 25, "1978 - 1980" = 26,
                                     "1981 - 1983" = 27, "1984 - 1986" = 28,
                                     "1987 - 1989" = 29, "1990 - 1992" = 30,
                                     "1993 - 1995" = 31, "1996 - 1998" = 32,
                                     "1999 - 2001" = 33, "2002 - 2004" = 34,
                                     "2005 - 2007" = 35, "2008 - 2010" = 36,
                                     "2011 - 2013" = 37, "2014 - 2016" = 38,
                                     "2017 - 2019" = 39, "2020 - 2022" = 40), 
                      selected = 1),
          
          hr(),
          fluidRow(column(3, verbatimTextOutput("value")))
          
        ),

        # Show a plot of unemployment andn inflation on same axes over time
        mainPanel(
            plotOutput("UIoverTimePlot"),  
            plotOutput("UIScatterPlot")
        )
    )
))
