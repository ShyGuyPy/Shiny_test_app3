dashboardPage(
  dashboardHeader(title = "take3",
                  tags$li(textOutput("date_text"),
                          class = "dropdown")),
  dashboardSidebar(#tags$li("this is the sidebar"),
    dateInput(inputId = "date", label = "enter a date", value = "1998-10-04")),
  dashboardBody(    tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "CSS/main.css")
  ),
  
  htmlOutput(outputId = "test_output1"),
  fluidRow(
    column(
      width = 6,
      box(
        title=NULL,
        width=NULL,
        height=50,
        htmlOutput(outputId = "ibox")
      ),
      box(
        title=NULL,
        width=NULL,
        height=300,
        htmlOutput(outputId = "ibox2")
      ),
      box(
        title=NULL,
        width=NULL,
        height=50,
        htmlOutput(outputId = "ibox3")
      ),
      box(
        title = NULL,
        width = NULL,
        htmlOutput(outputId = "boxes")#,
        #tags$p("Western region: Drought Watch; Central region: Drought Warning")
      ),
      box(
        title = NULL,
        width = NULL,
        htmlOutput(outputId = "boxes2")
        #"NoVa: Drought Watch; Shenandoah: Drought Emergency")
      ),
      htmlOutput(outputId = "key_test"),
      htmlOutput(outputId = "key_test2")
      
      
    ))
  )
  
)