#'fars_map_state
#'
#'@description
#'given a state and a year,
#'plot all accident locations for that year in that state
#'
#'@param state.num
#'A numeric representation of a state
#'
#'@inheritParams make_filename
#'
#'@details
#'an error will be thrown if an invalid STATE number is supplied.
#'
#'@return
#'plots a map object of all accidents for the given state in the specified year
#'
#'@importFrom dplyr filter
#'@importFrom maps map
#'@importFrom graphics points
#'
#'@examples
#'\dontrun{
#'fars_map_state(-1, 1000000)
#'fars_map_state(1, 2015)
#'}
#'
#'@export
fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
