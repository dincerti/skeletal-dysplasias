shinyServer(function(input, output) {
  
  output$Table <- renderDataTable({  
    x <- diseases[feature %in% input$features]
    x <- x[, .N, by = disease]
    x <- x[order(-N)]
    x <- x[N >= input$range[1] & N <= input$range[2]]
    setnames(x, names(x), c("Disease", "# of Features"))
    return(x)
  }, options = list(pageLength = 10, searching = TRUE, searching = 1,
                    language = list(emptyTable = "No disease match found")))
})


