library(shiny)
library(ggplot2)

dataset <- diamonds


shinyUI(fluidPage(
  
  titlePanel('Diamond Explorer'),
  h4('Grid Layout - rows and columns'),
  fluidRow(
    column(4,
           sliderInput('sampleSize', 'Sample Size', min=1,max = nrow(dataset), value = min(1000, nrow(dataset)),
                       step = 500, round = 0),
           br(),
           checkboxInput('jitter','jitter'),
           checkboxInput('smooth', 'smooth')
          ),
    column(4,
          selectInput('x', 'X', names(dataset)),
          selectInput('y','Y', names(dataset), names(dataset)[[2]]),
          selectInput('color','Color', c(None = '.', names(dataset)))
          ),
    column(4,
           selectInput('facet_row','Facet Row', c(None='.', names(dataset))),
           selectInput('facet_column', 'Facet column', c(None='.', names(dataset)))   
          ),
    hr(),
    plotOutput('plot')
)))