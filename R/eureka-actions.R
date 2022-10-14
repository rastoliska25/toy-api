#eureka register
#' @export
register_api <- function() {
  library(httr)
  data <- list(
    instance = list(
      hostName = "toyApiTest",
      app = "com.toyApi.app",
      vipAddress = "127.0.0.1",
      secureVipAddress = "127.0.0.1",
      ipAddr = "127.0.0.1",
      status = "up",
      port = "8000",
      securePort = "8000",
      healthCheckUrl = "http://127.0.0.1:8000/health-check",
      statusPageUrl = "http://127.0.0.1:8000/__docs__/",
      homePageUrl = "http://127.0.0.1:8000",
      dataCenterInfo = list(class = "com.netflix.appinfo.InstanceInfo$DefaultDataCenterInfo",
                            name = "MyOwn")
    )
  )

  POST("http://localhost:8761/eureka/apps/toyApi",
       body = data,
       encode = "json")

}

heartbeat <- function(interval = 5) {
  PUT("http://localhost:8761/eureka/apps/com.toyApi.app/toyApiTest")
  later::later(heartbeat, interval)
}
