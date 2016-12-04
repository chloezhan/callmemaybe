
library(shiny)

library(shiny)

ui = fluidPage(title = "Final Project",
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
                             
                  tabPanel(title = "Request Type vs. Time",
                            plotOutput("requesttime"),
                            actionButton("monthclick", "Month"),
                            actionButton("weekdayclick", "Day of Week"),
                            actionButton("hourclick", "Hour")
                            ),
                             
                  tabPanel(title = "Request Type vs. Day of Week",
                            plotOutput("weekdayst")
                            ),
                  
                  tabPanel(title = "Request Type vs. Hour",
                            plotOutput("hourst")
                            ))),
            tabPanel(title = "Geographical Area",
               navlistPanel(
                   tabPanel(title = "Council District",
                              plotOutput("CD"),
                              actionButton("race", "Race"),
                              actionButton("age", "Age Group"),
                              actionButton("income", "Income"),
                              actionButton("edu", "Education")
                     ),
                     
                    tabPanel(title = "Zip Code",
                              plotOutput("zipcode")
                     ),
                     
                    tabPanel(title = "Neighborhood Council",
                              plotOutput("council")
                     )
                     
                    )))
                  
)

