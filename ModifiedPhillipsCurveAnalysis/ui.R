
library(shiny)

# Define UI for application that analyzes unemployment & inflation
shinyUI(
  dashboardPage(
    
    tags$style(type = "text/css", "h2 {text-align: center;}"),
    
    # Application title
    dashboardHeader(title = "Modified Phillips Curve Analysis - Unemployment vs. Inflation"),
    
    # Sidebar with a selection box for timeframe desired
    dashboardSidebar(
      selectInput("select", label = h3("Select Timeframe - Analysis Tab Only"), 
                  choices = list("Since 1960" , "1960's", "1970's",
                                 "1980's", "1990's", "2000's",
                                 "2010 - Present","1960 - 1964", 
                                 "1965 - 1969", "1970 - 1974", 
                                 "1975 - 1979", 
                                 "1980 - 1984", "1985 - 1989",
                                 "1990 - 1994", "1995 - 1999",
                                 "2000 - 2004", "2005 - 2009",
                                 "2010 - 2014", "2015 - Present",
                                 "1960 - 1962",
                                 "1963 - 1965", "1966 - 1968",
                                 "1969 - 1971", "1972 - 1974",
                                 "1975 - 1977", "1978 - 1980",
                                 "1981 - 1983", "1984 - 1986",
                                 "1987 - 1989", "1990 - 1992",
                                 "1993 - 1995", "1996 - 1998",
                                 "1999 - 2001", "2002 - 2004",
                                 "2005 - 2007", "2008 - 2010",
                                 "2011 - 2013", "2014 - 2016",
                                 "2017 - 2019", "2020 - 2022"), 
                  selected = 1),
      
      hr(),
      fluidRow(column(3, verbatimTextOutput("value")))
      
    ),
    
    # Show a scatter plot and a line graph of unemployment and inflation based on selected timeframe
    dashboardBody(
      tabsetPanel(type = "tabs",
                  tabPanel("Analysis", plotOutput("UIScatterPlot"), plotOutput("UIoverTimePlot")),
                  tabPanel("Insights", plotOutput("UIsince83Plot"), plotOutput("UIrecessionsPlot")) 
      )
    )
  )
)