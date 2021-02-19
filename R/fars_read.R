#'fars_read
#'
#'@description
#'reads a csv file to a tibble if given filename corresponding to csv file
#'
#'@param filename
#'a character string filename mapping to a csv file in the working directory
#'
#'@details
#'if character string does not match a filename, error is thrown
#'
#'@return
#'a tibble
#'
#'@importFrom readr read_csv
#'@importFrom dplyr tbl_df
#'
#'@examples
#'\dontrun{
#'fars_read('nonsense_name_that_will_throw_error')
#'fars_read('accident_2015.csv.bz2')
#'}
#'
#'@export
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}

