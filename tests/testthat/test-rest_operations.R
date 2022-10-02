test_that("Store yearly unemployment data test, success", {
  # TODO create test, which check whether data are stored in required format
  rest_store_yearly_unemployment_data()

  #Dates to store format test
  is.right_date_format <- function(x)
    ! is.na(as.Date(x, fromat = "%Y-%m-%d %H:%M:%S"))

  test_date <- T
  for (i in 1:nrow(yearAverages)) {

    datas <- yearAverages[i,]
    date <- datas$Date

    if (!(is.right_date_format(date))) {
      test_date <- F
    }

  }

  expect_true(test_date, T)


  # Values to store format test
  test_value <- T
  for (i in 1:nrow(yearAverages)) {

    datas <- yearAverages[i, ]
    value <- datas$Value

    if (!(length(value) > 0 & is.numeric(value))) {
      test_value <- F

    }
  }

  expect_true(test_value, T)

})

test_that("Get yearly unemplyment data test, success", {
  # TODO create test, which check whether data are loaded in required format
  dataframe_from_mysql <-
    rest_get_yearly_unemployment_data("2000-01-23", "2019-01-23")

  #Dates to load format test
  is.right_date_format <- function(x)
    ! is.na(as.Date(x, format = "%Y-%m-%d %H:%M:%S"))

  test_date <- T
  for (i in 1:nrow(dataframe_from_mysql)) {

    datas <- dataframe_from_mysql[i,]
    date <- datas$Date

    if (!(is.right_date_format(date))) {
      test_date <- F
    }

  }

  expect_true(test_date, T)

  # Values as numeric format
  test_value <- T
  for (i in 1:nrow(dataframe_from_mysql)) {

    datas <- dataframe_from_mysql[i, ]
    value <- datas$Value

    if (!(length(value) > 0 & is.numeric(value))) {
      test_value <- F

    }
  }

  expect_true(test_value, T)

  # correctness of data(Dates)
  expect_lt(max(dataframe_from_mysql$Date),
            as.POSIXct("2020-01-01 01:01:01"))
  expect_gt(min(dataframe_from_mysql$Date),
            as.POSIXct("1999-01-23 01:01:01"))

  # correctness of data(Average values)
  specify_decimal <-
    function(x, k)
      trimws(format(round(x, k), nsmall = k)) #decimals rounding function

  #2005 average value data correction test
  values_2005 <- c(4.996717, 5.003654, 5.011637, 5.020076)
  average_value_2005 <-
    subset(dataframe_from_mysql,
           Date >= "2004-10-01" & Date <= "2005-10-01")

  expect_equal(specify_decimal(average_value_2005$Value, 6),
               specify_decimal(mean(values_2005), 6))

  #2015 average value data correction test
  values_2015 <- c(4.731372, 4.756195, 4.782687, 4.810394)
  average_value_2015 <-
    subset(dataframe_from_mysql,
           Date >= "2014-10-01" & Date <= "2015-10-01")

  expect_equal(specify_decimal(average_value_2015$Value, 6),
               specify_decimal(mean(values_2015), 6))

})
