#  ------------------------------------------------------------------------
#
# Title : App - Server
#    By : Quentin Villotta
#  Date : 16/05/2023
#    
#  ------------------------------------------------------------------------

server <- function(input, output) {
  data <- reactive({
    
    data_color <-hsos %>%
      mutate(logical_tent = case_when(!! rlang::sym(input$inputVar) == "Yes" ~ TRUE,
                                      !! rlang::sym(input$inputVar) == "No" ~ FALSE,
                                      !!rlang::sym(input$inputVar) %in%  c("No","Yes") ~ NA,
                                      .default = NA)) %>%
      group_by(`District p-code`) %>%
      summarise(prop_tent = mean(logical_tent, na.rm = TRUE)) %>%
      inner_join(x = sda_gdb,
                 by = c("admin2Pcode" ="District p-code")) %>%
      mutate(color_col = rbPal(10)[as.numeric(cut(prop_tent, breaks = 10))],
             district_name = toupper(admin2Name_en),
             info = paste0(district_name, " | ", round(prop_tent,2)))
    
  })
  
  output$map <- renderGoogle_map({
    req(input$inputVar)
    data() %>%
      google_map(key = gm_api_key) %>%
      add_polygons(polyline = "Shape", 
                   mouse_over = "info",
                   fill_colour = "color_col",
                   update_map_view = TRUE)
  })
}
