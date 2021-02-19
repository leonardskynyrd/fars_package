#'make_filename
#'
#'@description
#'makes a filename from a character year input
#'
#'@param year
#'a character string or numeric representation of a year
#'
#'@details
#'no errors will be thrown, you can toss this baby anything ;)
#'
#'@return
#'a character string
#'
#'@examples
#'\dontrun{
#'make_filename('absolute_nonsens')
#'make_filename('1970')
#'}
#'
#'@export
make_filename <- function(year) {
  year <- as.integer(year)
  system.file("extdata", sprintf("accident_%d.csv.bz2", year), package = "package")
}

