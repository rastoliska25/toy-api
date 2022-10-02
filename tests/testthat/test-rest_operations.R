test_that("Store yearly unemployment data test, success", {
  # TODO create test, which check whether data are stored in required format
  rest_store_yearly_unemployment_data()

  #Dates to store format test
  is.right_date_format <- function(x)
    ! is.na(as.Date(x, fromat = "%Y-%m-%d %H:%M:%S"))

  for (i in 1:nrow(yearAverages)) {
    test_date <- T

    datas <- yearAverages[i,]
    date <- datas$Date

    if (!(is.right_date_format(date))) {
      test_date <- F
    }

  }

  expect_true(test_date, T)


  # Values format test
  for (i in 1:nrow(yearAverages)) {
    test_value <- T

    datas <- yearAverages[i, ]
    value <- datas$Value

    if (!(length(value) > 0 & is.numeric(value))) {
      test_value <- F

    }
  }

  expect_true(test_value, T)

})
#
# test_that("Get yearly unemplyment data test, success", {
#   # TODO create test, which check whether data are loaded in required format
#   rest_get_yearly_unemployment_data()
# })
