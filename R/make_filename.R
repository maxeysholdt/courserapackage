#' Make .csv.bz2 file name
#'
#' \code{make_filename} takes a year and creates a filename string according to
#' this year
#'
#' @param year The input year as integer
#'
#' @return Returns a file name as string according to this patter:
#' "accident_year.csv.bz2"
#'
#' @examples
#' \dontrun{make_filename("2015")}


make_filename <- function(year) {
      year <- as.integer(year)
      sprintf("accident_%d.csv.bz2", year)
}

