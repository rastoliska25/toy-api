#' Read Unemployement US data
#'
#' @return data.frame
#' @export
#' @examples
#' \donotrun{read_quandl_unemployement_data()}
read_quandl_unemployement_data <- function() {
  library(magrittr)

  logging::loginfo("Start reading Quandl data.")

  tryCatchLog::tryCatchLog({
    res <-
      Quandl::Quandl("FRED/NROUST", api_key = 'ooxzxpTkpnGzBM6j9KWx') %>% data.table::as.data.table()

    res[, Date := lubridate::ymd(Date)]
  },
  error = function(e) {
    stop("Error in reading Quandl data, I must stop")
  })

  logging::loginfo("Finished reading Quandl data.")

  res <<- res
}
