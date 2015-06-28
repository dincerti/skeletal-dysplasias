
library("shiny")
library("shinysky")
library("data.table")
diseases <- fread("data/lachman_table_reformat.csv")
features <- sort(unique(diseases$feature))

# Define UI for application that draws a histogram
shinyUI(fluidPage(
 
  # Application title
  titlePanel("Skeletal Dysplasias"),
  
#   # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      select2Input("features","Features", 
                   choices = features),
      
      sliderInput("range", 
                  label = "Range for # of Features:",
                  min = 1, max = length(features), value = c(2, length(features)),
                  step = 1)
    
      ),
    
    # Show a plot of the generated distribution
    mainPanel(
      dataTableOutput("Table") 
    )
  )
))
