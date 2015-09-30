#' new_program_stage_table
#'
#' creates an empty table with dummy values
#'
#' @return data.frame
#' @author Reinhard Simon
#' @export
new_program_stage_table <- function(){
  crop_id   <- c("SP", "SP", "SP", "SP") # must be two upper case letters
  program_stage_sequence <- 1:4
  program_stage_id <- c("CB", "OT", "PT", "AT")
  program_stage_name <- c("Crossing Block", "Observational Trial", "Preliminary Trial",
                          "Advanced Trial")
  res <- as.data.frame(cbind(crop_id, program_stage_sequence, program_stage_id,
                             program_stage_name),
                       stringsAsFactors = FALSE)
  crops <- fbcrops::get_crop_table()
  res$crop_id <- as.factor(res$crop_id)
  levels(res$crop_id) <- sort(unique(crops$crop_id))

  res
}

#' get_program_stage_table
#'
#' always returns a table
#'
#' @return data.frame
#' @author Reinhard Simon
#' @export
get_program_stage_table <- function(){
  fns <- fbglobal::fname_program_stage()

  if(!file.exists(fns)) {
    base_dir <-  dirname(fns)
    if(!dir.exists(base_dir)) dir.create(base_dir)
    table_program_stages <- new_program_stage_table()
    save(table_program_stages, file = fns)
  }
  load(fns)
  table_program_stages
}

#' post_program_stage_table
#'
#' store program_stage table
#'
#' @param table_program_stages a data frame
#' @author Reinhard Simon
#' @export
post_program_stage_table <- function(table_program_stages){
  save(table_program_stages, file = fbglobal::fname_program_stage())
}
