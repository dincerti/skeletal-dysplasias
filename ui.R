# title
title <- titlePanel("Skeletal Dysplasias")

# select inputs
select <- selectInput("features","Features", 
                       choices = features,
                      multiple = TRUE,
                      selected = NULL)
sidebar <- sidebarPanel(select)

# main panel
main <- mainPanel(dataTableOutput("Table")) 

# UI
fluidPage(title, sidebar, main)
 


