#' Run the housing prediction API
#'
#' @param host Character. Address to run API on
#' @param port Integer. Port to run API on
#' @param ... Options passed to \code{plumber::plumb()$run()}
#' @examples
#' \dontrun{
#' run_api()
#' run_api(swagger = TRUE, port = 8000)
#' }
#' @return A running Plumber API
#' @export

library(tempr)

run_api <- function(host = '0.0.0.0', port = 8000, ...) {
  register_api()
  heartbeat()
  plumber::plumb(dir = system.file("plumber", package = "toyAPI"))$run(host, port, ...)
}

# docker run:

# register_api()
# heartbeat()
# run_api <- plumber::plumb("/inst/plumber/plumber.R")
# run_api$run(port = 8000,
#             host = "0.0.0.0",
#             swagger = TRUE)
