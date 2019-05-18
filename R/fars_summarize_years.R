#' Number of fatal injuries per month
#'
#' \code{fars_summarize_years} summarizes the number of fatal injuries for each
#' month of the years you put in.
#'
#' @param years The input years either as list of strings or a as a single
#' string for one year
#'
#' @return Returns a \link{tibble} with all the number of fatal injuries for each
#' month of the years you used as input. If there is no correspnding Report the
#' functions returns a warning.
#'
#' @import dplyr
#' @importFrom magrittr "%>%"
#' @importFrom tidyr spread
#'
#' @examples
#' \dontrun{fars_read_years(2015:2018)}
#' \dontrun{fars_read_years("2015:2018")}
#' @export

fars_summarize_years <- function(years) {
      dat_list <- fars_read_years(years)
      dplyr::bind_rows(dat_list) %>%
            dplyr::group_by(year, MONTH) %>%
            dplyr::summarize(n = n()) %>%
            tidyr::spread(year, n)
}


