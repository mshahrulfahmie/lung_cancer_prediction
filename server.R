#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$observation <- renderTable({
    mlinputs <- reactiveValuesToList(input)
    
    mlmodel <- "SUPPORT VECTOR MACHINE"
    pred <- as.character(predict(fit.svm, mlinputs))
    
    
    mlmodel <- append(mlmodel, "LINEAR DISCRIMINANT ANALYSIS")
    pred <-  append(pred,
                    as.character(predict(fit.lda, mlinputs)))      
    
    mlmodel <- append(mlmodel, "K NEAREST NEIGHBOURS")
    pred <-  append(pred,
                    as.character(predict(fit.knn, mlinputs)))
    
    mlmodel <- append(mlmodel, "GRADIENT BOOSTING MACHINE")
    pred <-  append(pred,
                    as.character(predict(fit.gbm, mlinputs)))
    
    prediction <- data.frame(mlmodel, pred)
    colnames(prediction)[1] <- "Model"
    colnames(prediction)[2] <- "Prediction"
    
    output$PieChart <- renderPlot({
      
      ggplot(prediction, aes(x=factor(1), fill = Prediction)) +
        geom_bar(width = 5 ) +
        coord_polar("y") +
        labs(title = "Lung cancer risk (Yes (1)/No(0))")
    })
    prediction
    
  })
  
  output$eda1 <- renderPlot({
    
    hist(data$AGE, 
         main = "Age Distribution",
         xlab = "Age",
         breaks = seq(min(data$AGE),max(data$AGE)),
         col="darkmagenta",
         border = "black")
    
    
    
  })
  
  output$eda2 <- renderPlot({
    tbl <- with(data, table(LUNG_CANCER, SMOKING))
    ggplot(as.data.frame(tbl), aes(factor(SMOKING), Freq, fill = LUNG_CANCER)) +     
      geom_col(position = 'dodge')
    
  })
  
  output$eda3 <- renderPlot({
    tbl1 <- with(data, table(LUNG_CANCER, ALCOHOL.CONSUMING))
    ggplot(as.data.frame(tbl1), aes(factor(ALCOHOL.CONSUMING), Freq, fill = LUNG_CANCER)) +     
      geom_col(position = 'dodge')
    
  })
  
  
  output$eda4 <- renderPlot({
    tbl2 <- with(data, table(LUNG_CANCER, AGE))
    ggplot(as.data.frame(tbl2), aes(factor(AGE), Freq, fill = LUNG_CANCER)) +     
      geom_col(position = 'dodge')
    
  })
  
  output$compare <- renderPlot({
    bwplot(results)
    
    
  })
  
})