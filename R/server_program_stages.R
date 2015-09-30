#' server_program_stages
#'
#' Constructs table
#'
#' @param input shinyserver input
#' @param output shinyserver output
#' @param session shinyserver session
#' @param dom target dom element name
#' @author Reinhard Simon
#' @export
server_program_stages <- function(input, output, session, dom="hot_programstage"){
  values = shiny::reactiveValues()
  setHot_program_stage = function(x) values[[dom]] = x

  shiny::observe({
    input$saveBtn
    if (!is.null(values[[dom]])) {
      fbprstages::post_program_stage_table(values[[dom]])
    }

  })

  output[[dom]] = rhandsontable::renderRHandsontable({
    if (!is.null(input[[dom]])) {
      DF = rhandsontable::hot_to_r( input[[dom]])
    } else {
      DF = fbprstages::get_program_stage_table()
    }

    setHot_program_stage(DF)

    rh <- rhandsontable::rhandsontable(DF,   stretchH = "all", height = 400)
    rhandsontable::hot_table(rh, highlightCol = TRUE, highlightRow = TRUE)
  })
}
