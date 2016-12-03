
library(shiny)

library(shiny)

ui = fluidPage(title = "Random generator",
      tabsetPanel(
          tabPanel(title = "Time", 
              navlistPanel(
                  tabPanel(title = "Hour vs. Day of Week",
                            plotOutput("dayhour"),
                            actionButton("renorm", "Resample")
                            ),
                             
                  tabPanel(title = "Hour vs. Month",
                            plotOutput("monthhr")
                            ),
                             
                  tabPanel(title = "Request Type vs. Month",
                            plotOutput("monthst")
                            ),
                             
                  tabPanel(title = "Request Type vs. Hour",
                            plotOutput("hourst")
                            )))
                  
                )
)

