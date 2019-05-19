#' Read Fatality Analysis Report
#'
#' \code{fars_read} reads the annual Fatality Analysis Report of fatal injuries
#' suffered in motor vehicle traffic crashes using \link[readr]{read_csv}
#'
#' @param filename Either a path to a file, a conncetion or the data containing
#' the FAR. Can be all file formats which are readble by \link[readr]{read_csv}
#'
#'
#' @return The function returns the data as a \link{tibble}, a data frame
#'  with class \link{tibble}
#'
#' @import dplyr
#' @importFrom readr read_csv
#'
#' @examples
#' \dontrun{fars_read("accident_2013.csv.bz2")}
#' \dontrun{fars_read("accident_2013.csv")}

fars_read <- function(filename){
      if(!file.exists(filename))
            stop("file '", filename, "' does not exist")
      data <- suppressMessages({
            readr::read_csv(filename, progress = FALSE)
      })
      dplyr::tbl_df(data)
}

