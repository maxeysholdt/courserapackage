#' Map of fatal injuries
#'
#' \code{fars_map_state} draws a state map of the location of ball the fatal
#' injuries of a given year and state using the \link[maps]{map} function
#'
#' @param year The input year as an integer
#' @param state.num The input state number either as string or number
#'
#' @return Draws a map plot of the locations of all the fatal injuries in the
#' input year and state. If the input state number is not correct it returns an
#' error. If the are no accidents it returns a message.
#'
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points
#'
#' @examples
#' \dontrun{fars_map_state(1,2013)}
#' \dontrun{fars_map_state("1","2018")}
#' @export

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


