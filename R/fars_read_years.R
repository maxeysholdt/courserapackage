#' Return data for given year or sequence of years
#'
#' \code{fars_read_years} searches your working directory for files for the
#' corresponding Fatality Analysis Reports for the years you input and returns a
#' combined table with all the data for the years you input
#'
#' @param years The input years either as list of strings or a as
#' a single string for one year
#'
#' @return Returns a list of \link{tibble}s with all the data for the years you
#'  used as input. If there is no correspnding report the functions returns a
#'  warning.
#'
#' @import dplyr
#' @importFrom magrittr "%>%"
#'
#' @examples
#' \dontrun{fars_read_years(c("2014","2015"))}
#' \dontrun{fars_read_years("2015")}
#' @export

fars_read_years <- function(years) {
      lapply(years, function(year) {
            file <- make_filename(year)
            tryCatch({
                  dat <- fars_read(file)
                  dplyr::mutate(dat, year = year) %>%
                        dplyr::select(MONTH, year)
            }, error = function(e) {
                  warning("invalid year: ", year)
                  return(NULL)
            })
      })
}


