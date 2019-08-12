library(shiny)
library(shinyjs)

shinyUI(fluidPage(
  useShinyjs(),
  titlePanel('Demonstrating Javascript in shiny App'),
  list(h4('Add common javascript capabilities to the shiny  app without knowing javascript'),
  hr()),
  
  tags$div(id='t',style='color:green;',
           list(h4('Hello and welcome to this demo! 
                   This welcome message will disappear after 5 seconds')),hr()),
 
  fluidRow(
    column(width=2,
           list(actionButton(inputId='alert',label='Click to alert')
           )),
    
    column(width=3,style='outline-style:groove;outline-width:thin;',
           list(actionButton(inputId='hides',label='Hide Slider'),
                actionButton(inputId='shows',label='Show Slider'),
                sliderInput(inputId='slider',label='Slider',min=0,max=10,value = 5)
               )),
    
    column(width=2,
           list(actionButton(inputId='showh',label='Show hidden text'),
                actionButton(inputId='hideh', label='Hide text'),
                br(),
                hidden(tags$div(id='txt',list(helpText('This is a help text.'))))
           )),
    
    column(width=3,style='outline-style:groove;outline-width:thin;',
           list(actionButton(inputId='disable',label='Disable'),
                actionButton(inputId='enable',label='Enable'),
                sliderInput(inputId='sliderAble',label = 'Slider',min = 0,max = 10,value = 5)
             
           ))
  ),
  hr(),
  fluidRow(
    column(width=3,
           list(actionButton(inputId='button',label = 'Click and toggle plot'),
                plotOutput('plot')
             
           ))
  )
 
))