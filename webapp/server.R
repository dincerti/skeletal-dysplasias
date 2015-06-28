
library("shiny")
library("shinysky")
library("data.table")
diseases <- fread("data/lachman_table_reformat.csv")
setkey(diseases, feature, disease)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$Table <- renderDataTable({  
    x <- diseases[feature %in% input$features]
    x <- x[, .N, by = disease]
    x <- x[order(-N)]
    x <- x[N >= input$range[1] & N <= input$range[2]]
    setnames(x, names(x), c("Disease", "# of Features"))
    return(x)
  }, options = list(pageLength = 10, searching = TRUE, searching = 0,
                    language = list(emptyTable = "No disease match found")))
})


