test_that("warning issued if character supplied as state to fars_map_state instead of numeric", {
  expect_error(suppressWarnings(fars_map_state('foobar', 2013)))
})
