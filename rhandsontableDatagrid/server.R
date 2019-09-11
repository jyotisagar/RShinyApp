library(shiny)
library(rhandsontable)

shinyServer(
  function(input,output){
    a = sample(1:20, replace = TRUE)
    b = sample(1:20, replace = TRUE)
    c = a + b
    df = data.frame(a = a, b = b, c = c)
    
    # defining a reactive values object so as to keep track of change in state of data frame 
    dataValues = reactiveValues(data = df)
    
    output$table <- renderRHandsontable({
      rhandsontable(dataValues$data)
    })
    
    observeEvent(input$table$changes$changes,{
      xi = input$table$changes$changes[[1]][[1]]
      dataValues$data <- hot_to_r(input$table)
      dataValues$data[xi+1,3] = dataValues$data[xi+1,1] + dataValues$data[xi+1,2]
    })
    
    output$plot <- renderPlotly({
      plot_ly(data = dataValues$data, x = ~c, type = 'histogram' )
    })
  }
)