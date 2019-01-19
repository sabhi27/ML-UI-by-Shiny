library(shiny)
shinyUI(fluidPage(
  titlePanel("Machine Learning"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file","Upload the file"), 
      helpText("Default max. file size is 10MB"),
      checkboxGroupInput("col", "Select a column", character(0)),
      tags$hr(),
      h5(helpText("Select the read.table parameters below")),
      checkboxInput(inputId = 'header', label = 'Header', value = TRUE),
      checkboxInput(inputId = "stringAsFactors", "stringAsFactors", FALSE),
      br(),
      radioButtons(inputId = 'sep', label = 'Separator', choices = c(Comma=',',Semicolon=';',Tab='\t', Space=''), 
                   selected = ','),
      selectInput(inputId = 'data_prep', label = 'Data Preprocessing', choices = c('Missing_Data','Categorical_Data')),
      submitButton("Apply"),
      selectInput("reg", "Select the Desired Regression", c("Linear_Regression ","Polynomial_Regression"), 
                  selected = "Linear_Rgression")
    ),
   
     mainPanel(
      uiOutput("tb")
       )
    
  )
))