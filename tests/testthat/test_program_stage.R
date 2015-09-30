context("Program stages")

tbl_new <- new_program_stage_table()
tbl_get <- get_program_stage_table()

test_that("Dummy table is created.", {
  expect_true(is.data.frame(tbl_new), TRUE)
  expect_true(is.data.frame(tbl_get), TRUE)
})
