FROM alpine:latest

MAINTAINER Violetta Goldman <vgoldman@student.42.fr>

# Install telegraf
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# Installation
RUN apk update \
&& apk add mariadb mariadb-client && apk add --no-cache --upgrade bash \
&& rm -rf /var/cache/apk/*

# Copy initialisation scripts
COPY init.sh .
COPY setup.sh .
COPY wordpress.sql .
COPY telegraf.conf /etc/telegraf/telegraf.conf

# Add permission
RUN chmod +x init.sh
RUN chmod +x setup.sh

EXPOSE 3306

ENTRYPOINT [ "./init.sh" ]
