#'fars_read_years
#'
#'@description
#'given a vector of years,
#'return a list of tibbles corresponding to year with
#'month and year columns subset
#'
#'@param years
#'a vector of character or numeric years
#'
#'@details
#'if a year is not found in the data,
#'a warning message is thrown for that year only
#'
#'@return
#'a list of tibbles if all years are valid.
#'a list of tibbles and NULL values if some years are valid and other are not
#'a list of NULLs if no years are valid
#'
#'@importFrom magrittr %>%
#'@importFrom dplyr mutate select
#'
#'@examples
#'\dontrun{
#'fars_read_years(c(2015, 2013,  2014))
#'fars_read_years(c(1970, 100000,200000))
#'}
#'
#'@export
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, YEAR = year) %>%
        dplyr::select(MONTH, YEAR)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}

