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

run_api <- function(host = '0.0.0.0', port = 8000, ...) {
  plumber::plumb(dir = system.file("plumber", package = "toyAPI"))$run(host, port, ...)
}
