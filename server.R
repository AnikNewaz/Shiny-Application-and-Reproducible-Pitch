library(shiny)
library(ggplot2)
library(dplyr)

shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
        mtcars$cyl <- as.factor(mtcars$cyl)
        data.cars <- filter(mtcars, grepl(input$wt, wt), grepl(input$cyl, cyl), grepl(input$am, am))
        
        fit <- lm( mpg~hp, data.cars)
       
        pred <- predict(fit, newdata = data.frame(am = input$am,
                                                  hp = input$hp,
                                                  cyl = input$cyl,
                                                  wt = input$wt))
     
        plot <- ggplot(data=data.cars, aes(x=hp, y = mpg))+
            geom_point(aes(color = cyl), alpha = 0.9)+
            geom_smooth(method = "lm")+
            geom_vline(xintercept = input$hp, color = "red")+
            geom_hline(yintercept = pred, color = "blue")
        plot
    })
    output$result <- renderText({
        mtcars$cyl <- as.factor(mtcars$cyl)
        data.cars <- filter(mtcars, grepl(input$wt, wt), grepl(input$cyl, cyl), grepl(input$am, am))
        fit <- lm( mpg~hp, data.cars)
        pred <- predict(fit, newdata = data.frame(am = input$am,
                                                  hp = input$hp,
                                                  cyl = input$cyl,
                                                  wt = input$wt))
        res <- paste(round(pred, digits = 2))
        res
    })
    
})