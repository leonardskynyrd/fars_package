test_that("error issued if non-existing fars filename supplied to fars_read instead of existing fars filename", {
  expect_error(fars_read('foobar'))
})
