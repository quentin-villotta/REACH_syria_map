
#  ------------------------------------------------------------------------
#
# Title : App - UI
#    By : Quentin Villotta
#  Date : 16/05/2023
#    
#  ------------------------------------------------------------------------

ui <- fluidPage(
  tags$h1("SYRIA HSOS"),
  tags$h2("Northwest Syria - March 2023"),
  fluidRow(
    column(
      width = 3,
      selectInput(inputId = "inputVar", label = "Repoted common IDP shelter type:", multiple = FALSE, 
                  choices = input_colnames, selected = "Three most common IDP shelter types - Tent")
    ),
    column(
      width = 9,
      height = 150,
      google_mapOutput(outputId = "map")
    )
  )
)
