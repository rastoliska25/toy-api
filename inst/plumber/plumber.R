library(plumber)

#' @apiTitle Toy API example using plumber

#' Check status of API
#' @get /health-check
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
# @param from date to return data from
# @param to date to ruturn data to
#' @get /toy-api/get-yearly-unemployment-data
function(req) {
  # rest_get_yearly_unemployment_data(from, to)
  rest_get_yearly_unemployment_data("2000-01-23", "2019-01-23")
}





