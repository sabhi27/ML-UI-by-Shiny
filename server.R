library(shiny)
 options(shiny.maxRequestSize = 10*1024^2)

shinyServer(function(input,output,session){
  
  
  data_set <- reactive({
    file1 <- input$file
    if(is.null(file1)){return()} 
    read.table(file=file1$datapath, sep=input$sep, header = input$header, stringsAsFactors = input$stringAsFactors)
    
  })
  
  
  observeEvent(data_set(), {
    updateCheckboxGroupInput(session, "col", choices = names(data_set()))
  })
  
  output$filedf <- renderTable({
    if(is.null(data_set())){return ()}
    input$file
  })
  
  output$sum <- renderTable({
    if(is.null(data_set())){return ()}
    summary(data_set())
    
  })
  
  output$table <- renderTable({
    if(is.null(data_set())){return ()}
    data_set()
  })
  
  output$tb <- renderUI({
    if(is.null(data_set()))
      h5("Powered by", tags$img(src='R-studio.png', heigth=200, width=200))
    else
      tabsetPanel(tabPanel("About file", tableOutput("filedf")),tabPanel("Data", tableOutput("table")),
                  tabPanel("Summary", tableOutput("sum"))
                 )
  })
})