test_that("Test of reading Quandl, success", {
  # TODO test of reading Quandl data are in required format
  read_quandl_unemployement_data()
})

httptest::without_internet({
  test_that("Test of reading Quandl, fail", {
    # TODO test of error if Quandl service is not available
    read_quandl_unemployement_data()
  })
})

