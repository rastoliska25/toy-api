#' Main Operation of POST storing yearly unemployment data REST service
#'
#' @return
#' @export
#' @examples
rest_store_yearly_unemployment_data <- function() {
  # reading data, use toyAPI::read_quandl_unemployement_data()
  read_quandl_unemployement_data()

  # TODO averaging by year
  res$Date <- as.Date(res$Date)   #convert to date
  res$Year <-
    format(res$Date, format = "%Y-01-01 01:01:01")    #years

  yearAverages <-
    aggregate(res[, 2], list(res$Year), mean)  #average values by year

  colnames(yearAverages)[1] <- "Date"   #change first column name

  yearAverages[['Date']] <-
    as.POSIXct(yearAverages[['Date']],  #format to date
               format = "%Y-%m-%d %H:%M:%S")

  yearAverages <<- yearAverages
  # TODO store data in DB, where Date is primary key and Value numeric
  library(DBI)
  library(RMySQL)

  con <<-
    dbConnect(
      odbc::odbc(),
      .connection_string = "Driver={MySQL ODBC 8.0 Unicode Driver};",
      Server = "127.0.0.1",
      Database = "shop",
      UID = "root",
      PWD = "password",
      Port = 3306
    )

  # create table and insert data
  dbGetQuery(
    con,
    "CREATE TABLE IF NOT EXISTS toy_tables (Date DATETIME,Value DOUBLE,PRIMARY KEY(Date));"
  )

  dbWriteTable(conn = con,
                name = "toy_tables",
                value = yearAverages,
                overwrite = TRUE)

  # TODO return calculated data as response
  dbReadTable(con, "toy_tables")
}

#' Main Operation of GET yearly unemployment data REST service
#' @param from
#' @param to
#' @return
#' @export
#' @examples
rest_get_yearly_unemployment_data <- function(from, to) {
  # TODO reading data from database based on criteria of from/to

  library(DBI)
  library(RMySQL)

  con <<- dbConnect(
    RMySQL::MySQL(),
    dbname = 'shop',
    host = '127.0.0.1',
    port = 3306,
    user = 'root',
    password = 'password'
  )

  library(dplyr)
  filter_date_from <- as.POSIXct(from, tz = "UTC")
  filter_date_to <- as.POSIXct(to, tz = "UTC")

  filteredData <- tbl(con, "toy_tables") %>%
    filter(Date > filter_date_from) %>%
    filter(Date < filter_date_to)

  # MySQL table to dataFrame because of "error missing value"
  dataframe <- as.data.frame(filteredData)

  dataframe

}
