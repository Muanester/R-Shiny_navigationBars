library(shiny)
library(shinythemes)

ui <- fluidPage(theme = shinytheme("united"),
                navbarPage(
                  "Form Name",
                  tabPanel("Home",
                           sidebarPanel(
                             tags$h3("Input: "),
                             textInput("txt1", "Given name:", ""),
                             textInput("txt2", "Surname:", ""),
                           ),
                           mainPanel(
                             h1("Header 1"),
                             h4("Output 1"),
                             verbatimTextOutput("txtout"),
                           )
                           ),
                  tabPanel("Report", "Nothing!")
                ))

server <- function(input, output) {
  output$txtout <- renderText({
    paste(input$txt1, input$txt2, sep = " ")
  })
}

shinyApp(ui = ui, server = server)


