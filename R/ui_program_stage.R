#' ui_program_stage
#'
#' returns a re-usable user interface element
#'
#' @author Reinhard Simon
#' @param type of ui Element; default is a tab in a shiny dashboard
#' @param title display title
#' @param name a reference name
#' @param output name of output element
#' @export
ui_program_stage <- function(type = "tab", title = "Program stage configuration",
                             name = "resource_program_stage",
                    output = "hot_programstage"){
  shinydashboard::tabItem(tabName = name,
                          shiny::fluidRow(
                            shinydashboard::box(height = 500,
                              title = title,
                              rhandsontable::rHandsontableOutput(output)
                            )
                          )
  )
}
