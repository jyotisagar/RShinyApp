library(shiny)

shinyUI(fluidPage(
  titlePanel('Dynamic user Interface - RenderUI in Shiny'),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = 'data1',label = 'Select the Dataset of your choice',choices = c('iris','mtcars','trees')),
      br(),
      p('The following selectInput dropdown choices are dynamically 
         populated based on the dataset selected by the user above'),
      br(),
      uiOutput('vx'), # vx is coming from renderUI in server.R
      uiOutput('vy')  # vy is coming from renderUI in server.R
    ),
    mainPanel(
      plotOutput('myPlot')
    )
  )
))