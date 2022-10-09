FROM rocker/r-ver:4.0.2

USER root

RUN apt-get update -qq && apt-get install -y \
libssl-dev \
libcurl4-gnutls-dev \
libxml2-dev \
libjq-dev \
libprotobuf-dev \
protobuf-compiler \
make \
libgeos-dev \
libudunits2-dev \
libgdal-dev \
gdal-bin \
libproj-dev \
libv8-dev

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
RUN R -e "install.packages('RMariaDB')"
RUN R -e "install.packages('RMySQL')"
RUN R -e "install.packages('dbplyr')"

COPY / /

RUN R -e "install.packages('tempr.tar.gz', repos = NULL, type = 'source')"
RUN R -e "install.packages('tempr')" 

EXPOSE 8000

ENTRYPOINT ["Rscript", "/R/run_api.R"]

