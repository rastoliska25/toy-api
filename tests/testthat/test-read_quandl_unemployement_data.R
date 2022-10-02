test_that("Test of reading Quandl, success", {
  # TODO test of reading Quandl data are in required format
  read_quandl_unemployement_data()

  expect_equal(2*2,4)

  is.ymd_hms2 <- function(x) !is.na(as.Date(x, "%Y-%m-%d %H:%M:%S"))

  is.ymd_hms2("2020-0101 22:22:22")

})








# httptest::without_internet({
#   test_that("Test of reading Quandl, fail", {
#     # TODO test of error if Quandl service is not available
#     read_quandl_unemployement_data()
#   })
# })
