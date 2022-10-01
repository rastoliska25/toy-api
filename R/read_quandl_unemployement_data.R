#' Read Unemployement US data
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \donotrun{read_quandl_unemployement_data()}
#'
#'apikey: ooxzxpTkpnGzBM6j9KWx
#'
library(magrittr)
read_quandl_unemployement_data <- function(){
  logging::loginfo("Start reading Quandl data.")

  tryCatchLog::tryCatchLog({
    res <- Quandl::Quandl("FRED/NROUST") %>% data.table::as.data.table()

    res[, Date := lubridate::ymd(Date)]
  },
  error = function(e){
    stop("Error in reading Quandl data, I must stop")
  })

  logging::loginfo("Finished reading Quandl data.")

  res
}
