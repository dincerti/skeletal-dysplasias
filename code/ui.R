# title
title <- titlePanel("Skeletal Dysplasias")

# select inputs
select <- selectInput("features","Features", 
                       choices = features,
                      multiple = TRUE,
                      selected = NULL)
slider <- sliderInput("range", 
                      label = "Range for # of Features:",
                      min = 1, max = length(features), 
                      value = c(2, length(features)),
                      step = 1, ticks = FALSE)
sidebar <- sidebarPanel(select, slider)

# main panel
main <- mainPanel(dataTableOutput("Table")) 

# UI
fluidPage(title, sidebar, main)
 


