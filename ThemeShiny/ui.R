library(shiny)
library(shinythemes)

shinyUI(fluidPage(
  theme = shinytheme('slate'), # sandstone,flatly
  navbarPage(
    title = 'The Shiny Themes',
    id = 'nav',
    themeSelector(),
    tabPanel('Data', value = 'Data',
             sidebarLayout(
               sidebarPanel(
                 selectInput('dataset', 'Select the dataset', choices = c('mtcars dataset')),
                 tags$hr(),
                 sliderInput('n','Select the no of rows', min =2, max=10, value = 4),
                 tags$hr(),
                 actionButton('button', 'ActionButton'),
                 tags$hr(),
                 actionButton('c', 'Radiobuttons',icon =  NULL, choices = c('Yes', 'No'))
               ),
               mainPanel(
                 tabsetPanel(
                   tabPanel('Dataset', tableOutput('table')),
                   tabPanel('Summary Stats', verbatimTextOutput('summary'))
                 )
               )
             )
             ),
    tabPanel('Plots',value = 'plots')
  )
))