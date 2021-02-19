#'fars_summarize_years
#'
#'@description
#'for the years supplied,
#'return a tibble of the numbers of per-month accident occurrences for those years
#
#'@inheritParams fars_read_years
#'
#'@details
#'an error will be thrown if all supplied years are invalid.
#'
#'@return
#'a tibble
#'
#'
#'@importFrom magrittr %>%
#'@importFrom dplyr bind_rows group_by summarize n
#'@importFrom tidyr spread
#'
#'@examples
#'\dontrun{
#'fars_summarize_years(c(2015, 2013,  2014))
#'fars_summarize_years(c(1970, 100000,200000))
#'}
#'
#'@export
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(YEAR, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(YEAR, n)
}
