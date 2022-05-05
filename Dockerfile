FROM ubuntu:20.04

LABEL maintainer="Ed Hong <edhongcyd@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y wget php7.4 php7.4-pgsql php7.4-mbstring && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/phppgadmin

RUN wget --no-check-certificate https://github.com/phppgadmin/phppgadmin/releases/download/REL_7-13-0/phpPgAdmin-7.13.0.tar.gz && \
    tar xvfz phpPgAdmin-7.13.0.tar.gz --strip=1 && \
    rm phpPgAdmin-7.13.0.tar.gz

COPY config.inc.php conf/config.inc.php

EXPOSE 80/tcp

CMD ["php", "-S", "0.0.0.0:80"]
