FROM alpine:latest

MAINTAINER Violetta Goldman <vgoldman@student.42.fr>

# Installation
RUN apk update \
&& apk add mariadb mariadb-client && apk add --no-cache --upgrade bash \
&& rm -rf /var/cache/apk/*

# Copy initialisation script
COPY ./init.sh .
COPY ./setup.sh .
COPY wordpress.sql .

# Add permission
RUN chmod +x init.sh
RUN chmod +x setup.sh

EXPOSE 3306

ENTRYPOINT [ "./init.sh" ]
