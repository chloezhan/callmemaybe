library(shiny)
library(ggplot2)
library(dplyr)

server = function(input, output) {
  
  weekdayst = reactive({
    weekdayst = read.csv("weekdayst.csv")
    weekdayst$day = factor(weekdayst$day, levels = c("Mon","Tues","Wed","Thurs","Fri","Sat","Sun"))
  })
  
  output$dayhour <- renderPlot({
    dayhour$day = factor(dayhour$day, levels = c("Mon","Tues","Wed","Thurs","Fri","Sat","Sun"))
    ggplot(dayhour,aes(x=day,y=hour,fill=count))+
      geom_tile()+
      scale_fill_gradient(low="white",high="black") +
      ylab("Hour")+
      xlab("")+
      theme_classic()
  })
  
  #output$requesttime <- renderPlot({
   # monthst$month = factor(monthst$month, levels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"))
    #ggplot(monthst,aes(x=factor(month),y=RequestType,fill=count))+
     # geom_tile()+
      #scale_fill_gradient(low="white",high="black")+
      #theme_classic()+
      #xlab("") +
      #ylab("")+
      #theme_classic()
  #  })
    
 
    monthoutput = eventReactive(input$monthclick, {
      ggplot(monthst,aes(x=factor(month),y=RequestType,fill=count))+
        geom_tile()+
        scale_fill_gradient(low="white",high="black")+
        theme_classic()+
        xlab("") +
        ylab("")+
        theme_classic()
    })
    
    houroutput = eventReactive(input$hourclick, {
      ggplot(hourst,aes(x=RequestType,y=hour,fill=count))+
        geom_tile()+
        scale_fill_gradient(low="white",high="black") +
        theme_classic() +
        xlab("")+
        ylab("Hour")+
        coord_flip()
    })
    
    output$requesttime <- renderPlot({
      monthoutput()
      houroutput()
    })
  
  output$weekdayst <- renderPlot({
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