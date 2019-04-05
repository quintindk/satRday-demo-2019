FROM r-base:3.5.3

LABEL maintainer="Quintin de Kok quitnindk@netstar.co.za"

RUN apt-get update
RUN apt-get install -y libcurl4-openssl-dev libxml2-dev libssl-dev libgeos-dev

RUN mkdir -p app/cache
RUN mkdir -p app/data
RUN mkdir -p app/lib
RUN mkdir -p app/src
COPY app/config app/config
COPY install.R tmp/
RUN Rscript /tmp/install.R

COPY app app

EXPOSE 8090
WORKDIR /app
CMD ["Rscript", "src/app.R"]