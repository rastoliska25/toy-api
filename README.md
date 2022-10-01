# toy-api
Toy example API in R

### what to improve
- write a interface to your favorite database(postgres, ...) from R and store calculated yearly data in UTC date format (columns Date stored as timestamp and is primary key and Value stored as numeric)
see: R/rest_operations.R
- write unit tests to check whether data are stored and read correctly
  - see: [tests/testthat/test-read_quandl_unemployement_data.R](https://github.com/PowereX-jsa/toy-api/blob/feature/add_desc/tests/testthat/test-read_quandl_unemployement_data.R)
  - see: [tests/testthat/test-rest_operations.R](https://github.com/PowereX-jsa/toy-api/blob/feature/add_desc/tests/testthat/test-rest_operations.R)
- add automated build (for example via github action)
- dockerize app
- register your app in eureka (https://www.springcloud.io/post/2022-03/spring-cloud-introduction-to-service-discovery-netflix-eureka/#gsc.tab=0):
  - on start register with some app name (see documentation for eureka service)
  - send heartbeat every 5 seconds (see documentation for eureka service)
  - on stop deregister app (see documentation for eureka service)

### recommendations
- You can run skeleton API using function: ' toyAPI::run_api()' after loading package throught 'devtools::load_all(".")'
- We recommend to use RStudio IDE for development (u can used our dockerized version with preinstalled common libs https://hub.docker.com/repository/docker/powerex/pwx-rstudio)
- You can use eureka discovery service in docker-compose.yml file:
  - run `docker-compose up -d`
  - discovery service runs on `localhost:8761`
  - documentation (some things might be different now, for example no need to use `v2` in url): https://github.com/Netflix/eureka/wiki/Eureka-REST-operations
  - could use either xml or json
  - endpoint for listing apps: `GET localhost:8761/eureka/apps`
  - endpoint for registering app: `POST localhost:8761/eureka/apps/MYAPP`
  - endpoint for heartbeat: `PUT localhost:8761/eureka/apps/MYAPP/i-6589ef6`
  - endpoint for deregistering app: `DELETE localhost:8761/eureka/apps/MYAPP/i-6589ef6`


### Usefull links:
- https://r-pkgs.org/workflows101.html
- https://testthat.r-lib.org/
- https://www.rplumber.io/
