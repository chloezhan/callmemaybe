library(shiny)
library(ggplot2)
library(dplyr)

server = function(input, output) {
  
 
  
### volume time data 
  dayhour = reactive({
    dayhour = read.csv("dayhour.csv")
  })
  monthhr = reactive({
    monthhr = read.csv("monthhr.csv")
  })
  
### volume time plot
  ## volume time input
  volumetimeplot = reactive({
    if(input$vtselect == "hourday") {
      ggplot(dayhour(),aes(x=daynum,y=hour,fill=count))+
        geom_tile()+
        scale_fill_gradient(low="white",high="black") +
        ylab("Hour")+
        xlab("")+
        scale_x_continuous(breaks = seq(1,7,1),
                           labels = c("Mon", "Tues", "Wed", "Thurs", "Fri", "Sat", "Sun"))+
        theme_classic()
    } else{
      if(input$vtselect == "hourmonth") {
        ggplot(monthhr(),aes(x=monnum,y=hour,fill=count))+
          geom_tile()+
          xlab("")+
          ylab("Hour")+
          scale_x_continuous(breaks = seq(1,12,1),
                             labels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))+
          scale_fill_gradient(low="white",high="black")+
          theme_classic()
      } else { ### daymonth
        
      }}
  })
  ##vlume time output
  output$volumetime = renderPlot({
    volumetimeplot()
  })  

  output$dayhour <- renderPlot({
    ggplot(dayhour(),aes(x=daynum,y=hour,fill=count))+
      geom_tile()+
      scale_fill_gradient(low="white",high="black") +
      ylab("Hour")+
      xlab("")+
      scale_x_continuous(breaks = seq(1,7,1),
        labels = c("Mon", "Tues", "Wed", "Thurs", "Fri", "Sat", "Sun"))+
      theme_classic()
  })
  
###request time plot   
  requesttimeplot = reactive({
    if(input$time == "monthoutput") {
    ggplot(monthst,aes(x=factor(month),y=RequestType,fill=count))+
      geom_tile()+
      scale_fill_gradient(low="white",high="black")+
      theme_classic()+
      xlab("") +
      ylab("")+
      theme_classic()
    } else{
    if(input$time == "houroutput") {
      ggplot(hourst,aes(x=RequestType,y=hour,fill=count))+
        geom_tile()+
        scale_fill_gradient(low="white",high="black") +
        theme_classic() +
        xlab("")+
        ylab("Hour")+
        coord_flip()
    } }
  })

    output$requesttime <- renderPlot({
        requesttimeplot()
    })
  
    weekdayst = reactive({
      weekdayst = read.csv("weekdayst.csv")
    })
    
  output$weekdayst <- renderPlot({
    weekdayst() = weekdayst() %>%
    factor(weekdayst()$day, levels = c(2,6,7,5,1,3,4))
    ggplot(weekdayst(),aes(x=day,y=RequestType,fill=count))+
      geom_tile()+
      scale_fill_gradient(low="white",high="black")+
      theme_classic()
  })
  
  output$hourst <- renderPlot({
    ggplot(hourst,aes(x=RequestType,y=hour,fill=count))+
      geom_tile()+
      scale_fill_gradient(low="white",high="black") +
      theme_classic() +
      xlab("")+
      ylab("Hour")+
      coord_flip()
  })
  
    output$monthhr <- renderPlot({
      monthhr$month = factor(monthhr$month, levels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))
      ggplot(monthhr,aes(x=factor(month),y=hour,fill=count))+
        geom_tile()+
        xlab("")+
        ylab("Hour")+
        scale_fill_gradient(low="white",high="black")
  })
}