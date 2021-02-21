library(shiny)
library(ggplot2)


MAD <- read.csv('MEageMedianMAD.csv')

colours <-  c('#FF0000',"#CC00CC","#CC6600","#9933FF",'#00CCCC',"#0000CC")

shinyServer(function(input, output) {
  output$plot1 <- renderPlot({MAD %>% 
    ggplot() + 
      geom_line(aes(MAD[,5], MAD[,as.integer(input$var) + 5]), group = 1,color = sample(colours,1), size = 1) +
      geom_ribbon(aes(x = MAD[,5],ymax = (MAD[,as.integer(input$var) + 5] + MAD[,as.integer(input$var) + 27]), 
                      ymin = (MAD[,as.integer(input$var) + 5] - MAD[,as.integer(input$var) + 27])),group = 1, alpha = 0.5,fill = "#FFCCCC") +
      xlim(2,12) + xlab("log2PCW") + ylab(paste("Module",toString(input$var)," ",'Eigengene  Expression')) + 
      geom_vline(xintercept = 5.3)
  })
})
