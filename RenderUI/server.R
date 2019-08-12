library(shiny)
library(datasets)
library(ggplot2)

shinyServer(
  function(input,output){
    varXY <- reactive({
      switch (input$data1,
        'iris'   = names(iris),   # if the choice is iris dataset, it will return the names of all the columns of iris
        'mtcars' = names(mtcars), # if the choice is mtcars dataset, it will return the names of all the columns of mtcars
        'trees'  = names(trees)   # if the choice is trees dataset,it will return the names of all the columns of trees
      )
    })
    
    output$vx <- renderUI({
      selectInput('variableX','Select the First (X) variable', choices = varXY())
    })
    
    output$vy <- renderUI({
      selectInput('variableY', 'Select the First (Y) vaiable', choices = varXY())  
    })
    
    output$myPlot <- renderPlot({
      attach(get(input$data1)) # this will fetch the dataset
      plot(x = get(input$variableX), y = get(input$variableY), xlab = input$variableX, ylab = input$variableY)
    })
    
  }
) 