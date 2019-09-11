library(shiny)
library(rhandsontable)
library(plotly)

shinyUI(fluidPage(
  titlePanel('This is rhandsontable widget'),
  h4('Change event - Simulating a formula in data grid'),
  fluidRow(
    column(4, rHandsontableOutput('table'),
           actionButton('saveBtn','Save'),offset = 1
           ),
    column(4, plotlyOutput('plot')
          )
)))