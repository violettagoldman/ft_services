FROM alpine:latest

MAINTAINER Violetta Goldman <vgoldman@student.42.fr>

# Install telegraf
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# Installation
RUN apk update \
&& apk add influxdb && apk add --no-cache --upgrade bash \
&& rm -rf /var/cache/apk/*

# Copy initialisation script
COPY ./setup.sh .
COPY telegraf.conf /etc/telegraf/telegraf.conf

# Add permission
RUN chmod +x setup.sh

EXPOSE 8086

ENTRYPOINT [ "./setup.sh" ]
