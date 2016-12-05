
library(shiny)

ui = fluidPage(title = "Final Project",
      tabsetPanel(
          tabPanel(title = "Time", 
              navlistPanel(
                  tabPanel(title = "Volume Overtime",
                      selectInput("vtselect", label = "Service Volume in Different Time Period",
                          choices = list("Hour vs. Day of Week" = "hourday", 
                                        "Hour vs. Month" = "hourmonth", 
                                        "Day of Week vs. Month" = "daymonth"),
                          selected = "hourday"),
                      plotOutput("volumetime")
                      ),
                  
                  tabPanel(title = "Hour vs. Month",
                            plotOutput("monthhr")
                            ),
                             
                  tabPanel(title = "Request Type vs. Time",
                           selectInput("time", label = "Request Type vs. Time",
                            choices = list("Month" = "monthoutput", 
                                           "Day of Week" = "weekdayoutput", 
                                           "Hour" = "houroutput"),
                            selected = "monthoutput"),
                           plotOutput("requesttime")
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

