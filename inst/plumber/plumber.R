library(plumber)

#' @apiTitle Toy API example using plumber

setwd("C:\\rprojects\\toy-api-main")
source("./R/rest_operations.R", chdir = TRUE)
#' Check status of API
#* @get /health-check
function() {
  "API is running"
}

# main API operations
#' Store yearly average values for Unemploymenet data
#' @post /toy-api/store-yearly-unemployment-data
function(req) {

  rest_store_yearly_unemployment_data()

}

#' Get yearly average values for Unemploymenet data
#' @param from date to return data from
#' @param to date to ruturn data to
#' @get /toy-api/get-yearly-unemployment-data
function(req, from = as.character(Sys.Date() - 365*4), to = as.character(Sys.Date())) {

  rest_get_yearly_unemployment_data(from, to)

}

