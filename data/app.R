library(shiny)
library(shinydashboard)
library(shiny)
library(ggplot2)
library(dplyr)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Summary",tabName = "sum",icon=icon("dashboard"),
             menuSubItem("Request Type",tabName = "sumrt",icon=icon("dashboard")),
             menuSubItem("Request Source",tabName = "sumrs",icon=icon("dashboard"))
    ),
    menuItem("Request Type Analysis",tabName = "rt",icon=icon("dashboard"),
             menuSubItem("Seasonality",tabName = "seasonrt",icon=icon("dashboard")),
             menuSubItem("Geography",tabName = "geort",icon=icon("dashboard"))
    ),
    menuItem("Request Source Analysis",tabName = "rs",icon=icon("dashboard"),
             menuSubItem("Seasonality",tabName = "seasonrs",icon=icon("dashboard")),
             menuSubItem("Geography",tabName = "geo",icon=icon("dashboard"))
    ),
    menuItem("Processing Time Analysis",tabName = "pt",icon=icon("dashboard")),
    menuItem("",tabName = "geo",icon=icon("th"))
  ))

body<- dashboardBody(
  tabItems(
    tabItem(tabName = "t"),
    tabItem(tabName="season",
            h2("time1")),
    tabItem(tabName="sum1",
            h2("time")),
    tabItem(tabName="subtime",
            h2("time2")),
    tabItem(tabName = "geo",
            h2("Geographical Area"),
            fluidRow(
              tabBox(height=350,width=400,
                     selected="Tab1",
                     tabPanel("Summary", plotOutput("geomap")),
                     tabPanel("Council District", plotOutput("sumgeo")),
                     tabPanel("Request Type", "RT")
              )
            ), hr(), hr()
    )))

shinyApp(ui<-dashboardPage(
  dashboardHeader(title = "Final Project"),
  sidebar,
  body),
  server <- function(input, output) {
    rtbycd<-read.csv("rtbycd.csv")
    output$sumgeo<-renderPlot({
      ggplot(rtbycd,aes(reorder(RequestType,count),count))+
        geom_bar(stat="identity",aes(color=RequestType,fill=RequestType))+
        facet_wrap(~CD)+
        coord_flip()+
        theme_classic()+
        xlab("")+
        ylab("Request Volume")+
        theme(axis.text.y=element_blank(),
              axis.ticks.y=element_blank())
    })
    }
)
