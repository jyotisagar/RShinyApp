library(shiny)
library(datasets)

shinyUI(fluidPage(
  titlePanel('Navlist Panel navigation layout in Shiny') ,
  h5('This gives the ability to have tab like page!'),
  navlistPanel('Data',
    widths = c(2,9),
    tabPanel('About', h3('This is the About page')),
    tabPanel('Data Table', 
             tableOutput('table1'),
             h3('This is the first tab or page')
             ),
    tabPanel('Data Summary', verbatimTextOutput('summary1')),
    tabPanel(title = 'Scatter Plot', h3('Can have widgets & Plots')),
    tabPanel(title = 'Histogram', 
             sliderInput('n', 'Breaks', min = 5, max = 25, value = 10),
             plotOutput('plot')
             )
  )
  
))