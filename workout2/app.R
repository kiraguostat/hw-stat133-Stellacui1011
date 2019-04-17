#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(ggplot2)
library(reshape)

# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Three Investment Modalities"),
  
  # Sidebar  
  fluidRow(
    column(4,
           sliderInput("initial",
                       label = "Initial ",
                       min = 0,
                       max = 100000,
                       value = 1000,
                       pre = "$")),
    column(4,
           sliderInput("rate",
                       label = "Return rate(in %)",
                       min = 0,
                       max = 20,
                       value = 5)),
    column(4,
           sliderInput("years",
                       label = "Years",
                       min = 0,
                       max = 50,
                       value = 20)),
    column(4,
           sliderInput("a_contrib",
                       label = "Annual Contribution",
                       min = 0,
                       max = 50000,
                       value = 2000,
                       pre = "$")),
    column(4,
           sliderInput("growth",
                       label = "Growth rate(in %)",
                       min = 0,
                       max = 20,
                       value = 2)),
    column(4,
           selectInput("facet",
                       label = "Facet?",
                       c("Yes","No")))),
  
  # Show a plot of the relative frequencies
  mainPanel(
    h4(textOutput("plot_title")),
    plotOutput("timeline_plot", width = "150%"),
    h4(textOutput("Balances_title")),
    verbatimTextOutput("Balances")
  )
)

server <- function(input, output) {
  
  output$timeline_plot <- renderPlot({
    
    future_value <- c()
    for (i in 1:10){
      future_value[i]= input$initial*((1+(input$rate/100))^i)
    }
    
    future_value_annuity <- c()
    for (i in 1:10){
      future_value_annuity[i]=input$initial*((1+(input$rate/100))^i)+input$a_contrib*((((1+(input$rate/100))^i)-1)/(input$rate/100))
    }
    
    future_value_growth_annuity <- c()
    for (i in 1:10){
      future_value_growth_annuity[i]= input$initial*((1+(input$rate/100))^i)+(input$a_contrib*((((1+(input$rate/100))^i)-((1+(input$growth/100))^i))/((input$rate/100)-(input$growth/100))))
    }
    
    Balances <- data.frame(year=0:10,no_contrib=c(input$initial,future_value), fixed_contrib=c(input$initial,future_value_annuity), growing_contrib=c(input$initial,future_value_growth_annuity))
    
    if (input$facet == "Yes") {
      df.m = melt(Balances, id.vars ="year", measure.vars = c("no_contrib","fixed_contrib","growing_contrib"))
      
      ggplot(df.m, aes(year, value, colour = variable)) + geom_point() + geom_line() + scale_x_discrete(name ="Years", limits = c(0:10)) + ylab("Value") +  
        ggtitle("Three models of investing")+ theme_bw()+
        geom_area(aes(fill=variable,alpha = 0.1))  + facet_wrap(~variable)
    } else if (input$facet == "No"){
      df.m = melt(Balances, id.vars ="year", measure.vars = c("no_contrib","fixed_contrib","growing_contrib"))
      ggplot(df.m, aes(year, value, colour = variable)) + geom_point() + geom_line() + scale_x_discrete(name ="Years", limits = c(0:10)) + ylab("Balance") +  
        ggtitle("Growth of Investment Models") 
    }
    
  })
  
  Balances <- reactive({
    future_value <- c()
    for (i in 0:10){
      future_value[i]= input$initial*((1+(input$rate/100))^i)
    }
    
    future_value_annuity <- c()
    for (i in 0:10){
      future_value_annuity[i]=input$initial*((1+(input$rate/100))^i)+input$a_contrib*((((1+(input$rate/100))^i)-1)/(input$rate/100))
    }
    
    future_value_growth_annuity <- c()
    for (i in 0:10){
      future_value_growth_annuity[i]= input$initial*((1+(input$rate/100))^i)+(input$a_contrib*((((1+(input$rate/100))^i)-((1+(input$growth/100))^i))/((input$rate/100)-(input$growth/100))))
    }
    Balances <- data.frame(year=0:10,no_contrib=c(input$initial,future_value), fixed_contrib=c(input$initial,future_value_annuity), growing_contrib=c(input$initial,future_value_growth_annuity))
  })
  
  output$Balances <- renderPrint({(Balances())})
}

shinyApp(ui = ui, server = server)