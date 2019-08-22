library(shiny)
shinyServer(
  function(input,output){
    delay(5000,hide('t')) # this will hide the text after given delay period in ms
    browser()
    observeEvent(input$alert,
                 alert('This is an alert message.Thank you')
                 )
    
    observeEvent(input$showh, show('txt'))
    
    observeEvent(input$hideh, hide('txt'))
    
    observeEvent(input$shows, show('slider'))
    
    observeEvent(input$hides, hide('slider'))
    
    observeEvent(input$enable, enable('sliderAble'))
    
    observeEvent(input$disable, disable('sliderAble'))
    
    output$plot <- renderPlot(
      plot(mtcars$mpg)
    )
    
    observeEvent(input$button, {
      toggle('plot')
    })
    
  }
)