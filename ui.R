library(shiny)

shinyUI(fluidPage(
    
    
    titlePanel("Prediction of mpg"),
    
    
    sidebarLayout(
        sidebarPanel(
            helpText("Please Insert the Following Specifications of Your Car"),
            h3(helpText("Select:")),
            numericInput("hp", label = h4("Horsepower"), 
                         min = 50, max = 350, step = 5, value = 52),
            selectInput("cyl", label = h4("Cylinders"), 
                        choices = list("Unknown" = "*", "4" = "4", "6" = "6",
                                       "8" = "8")),
            numericInput("wt", label = h4("Weight (1000 lbs)"), 
                         min = 1, max = 6, step = 0.1, value = 3),
            selectInput("am", label = h4("Transmission"), 
                        choices = list( "automatic" = "0", "manual" = "1" ))
        ),
        
        
        mainPanel(
            plotOutput("distPlot"),
            h4("The mpg of Your Car is:"),
            h3(textOutput("result"))
        )
    )
))