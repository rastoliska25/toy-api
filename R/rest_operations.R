
#' Main Operation of POST storing yearly unemployment data REST service
#'
#' @return
#' @export
#'
#' @examples
rest_store_yearly_unemployment_data <- function(){

  # reading data, use toyAPI::read_quandl_unemployement_data()

  # TODO averaging by year

  # TODO store data in DB, where Date is primary key and Value numeric

  # TODO return calculated data as response

}

read_quandl_unemployement_data()



#' Main Operation of GET yearly unemployment data REST service
#'
#' @param from
#' @param to
#'
#' @return
#' @export
#'
#' @examples
rest_get_yearly_unemployment_data <- function(from, to){

  # TODO reading data from database based on criteria of from/to

}
