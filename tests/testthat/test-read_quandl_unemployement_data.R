test_that("Test of reading Quandl, success", {
  # TODO test of reading Quandl data are in required format
  read_quandl_unemployement_data()
  print(res)

  #Dates format test
  is.right_date_format <- function(x)
    ! is.na(as.Date(x, "%Y-%m-%d"))

  for (i in 1:nrow(res)) {
    test_date <- T

    datas <- res[i,]
    date <- datas$Date

    if (!(is.right_date_format(date))) {
      test_date <- F
    }

  }

  expect_true(test_date, T)

  # Values format test
  for (i in 1:nrow(res)) {
    test_value <- T

    datas <- res[i,]
    value <- datas$Value

    if (!(length(value) > 0 & is.numeric(value))) {
      test_value <- F

    }
  }

  expect_true(test_value, T)

})








# httptest::without_internet({
#   test_that("Test of reading Quandl, fail", {
#     # TODO test of error if Quandl service is not available
#     read_quandl_unemployement_data()
#   })
# })
