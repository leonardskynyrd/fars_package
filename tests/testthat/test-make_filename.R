test_that("warning issued if character supplied to make_filename instead of numeric", {
  expect_warning(make_filename('foobar'))
})
