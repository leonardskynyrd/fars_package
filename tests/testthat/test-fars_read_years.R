test_that("warning issued if character supplied to fars_read_years instead of numeric", {
  expect_warning(fars_read_years('foobar'))
})
