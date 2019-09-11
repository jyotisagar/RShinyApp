library(shiny)
shinyUI(navbarPage(title = 'Sidebar Layout', inverse = T, selected = 'Data Page',
                   position = 'static-top',
  tabPanel('About Page', h4('This app uses navbar for layout and mtcars dataset for demo')),
  tabPanel('Data Page', tableOutput('data')),
  tabPanel('Widgets & Sidebar', 
           sidebarLayout(
             sidebarPanel(
               sliderInput('b', 'Select no of BINS', min = 5, max= 20, value = 2)
             ),
             mainPanel(
               plotOutput('plot')
             )
           )
           ),
  navbarMenu('Menu Options',
             tabPanel('Menu item A - Summary Stats', verbatimTextOutput('summary')),
             tabPanel('Menu item B - Link to code',
                      h4(HTML(paste('Thanks for watching the video'))),
                      h4(HTML(paste('In case you have questions',a(href='jsagarbit@gmail.com'), 'email me')))
                      )
    
  )
))