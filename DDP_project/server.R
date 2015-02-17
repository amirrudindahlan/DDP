# load library and dataset
library(shiny)
data(mtcars)

# create the linear model
fitLinearModel <- function(predictors) 
{
  if ( !is.null(predictors) ) 
  {
    # draft the formula string
    f <- paste(names(mtcars)[1], '~', paste(predictors, collapse = ' + '))
    
    # run glm function
    glm(formula = f, data = mtcars)
  } 
  else
  {
    NA
  }
}

# plot of model
plotModel <- function(fit, n) 
{
  if ( !is.na(fit) ) 
  {
    plot(fit, which = n)
  }
}

# plot the summary
summarizeModel <- function(fit) 
{
  if( !is.na(fit) ) 
  {
    summary(fit)
  }
}

# create the shiny server
shinyServer
(
  function(input, output) 
  {
    
    # fit variable
    fit <- reactive(fitLinearModel(input$predictors))
    
    # output of fit model
    output$fit <- renderPrint(summarizeModel(fit()))
    
    # output of plots
    output$plot1 <- renderPlot(plotModel(fit(), 1))
    output$plot2 <- renderPlot(plotModel(fit(), 2))
    output$plot3 <- renderPlot(plotModel(fit(), 3))
    output$plot4 <- renderPlot(plotModel(fit(), 4))    
    
    # render out table of dataset
    output$table <- renderDataTable({mtcars},options = list(pageLength = 5))    
    
  }
)
