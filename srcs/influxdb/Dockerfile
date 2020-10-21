FROM alpine:latest

MAINTAINER Violetta Goldman <vgoldman@student.42.fr>

# Installation
RUN apk update \
&& apk add influxdb && apk add --no-cache --upgrade bash \
&& rm -rf /var/cache/apk/*

# Copy initialisation script
COPY ./setup.sh .

# Add permission
RUN chmod +x setup.sh

EXPOSE 8086

ENTRYPOINT [ "./setup.sh" ]
