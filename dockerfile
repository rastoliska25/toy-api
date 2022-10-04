FROM rocker/r-ver:4.0.2

RUN apt-get update -qq && apt-get install -y \
libssl-dev \
libcurl4-gnutls-dev \
libxml2-dev

RUN R -e "install.packages('plumber')"
RUN R -e "install.packages('magrittr')"
RUN R -e "install.packages('data.table')"
RUN R -e "install.packages('lubridate')"
RUN R -e "install.packages('logging')"
RUN R -e "install.packages('tryCatchLog')"
RUN R -e "install.packages('Quandl')"
RUN R -e "install.packages('DBI')"
RUN R -e "install.packages('dplyr')"
RUN R -e "install.packages('swagger')"
RUN R -e "install.packages('odbc')"
RUN R -e "install.packages('devtools')"

COPY / /

EXPOSE 8000

#CMD ["R", "-e", "toyAPI::run_api()"]
ENTRYPOINT ["Rscript", "/R/run_api.R"]

