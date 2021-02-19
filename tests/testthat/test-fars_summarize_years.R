test_that("error issued if character supplied to fars_summarize_years instead of numeric", {
  expect_error(suppressWarnings(fars_summarize_years('foobar')))
})
