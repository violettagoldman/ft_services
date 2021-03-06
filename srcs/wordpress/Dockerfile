FROM alpine:latest

MAINTAINER Violetta Goldman <vgoldman@student.42.fr>

# Install telegraf
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# Install nginx and its dependencies
RUN apk update && apk add nginx \
&& apk add --no-cache --upgrade bash \
&& apk add openssl && mkdir -p var/run/nginx \
&& apk add openssl openssh \
&& rm -rf /var/cache/apk/* && apk add wget && mkdir /www \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session openrc

RUN mkdir -p /www
COPY ./wordpress /www
COPY telegraf.conf /etc/telegraf/telegraf.conf

# SSL Key
RUN mkdir -p /etc/nginx/ssl && openssl req -newkey rsa:2048 -x509 -days 365 -nodes -keyout /etc/nginx/ssl/services.key -out /etc/nginx/ssl/services.pem -subj "/C=FR/ST=Paris/L=Paris/O=42, Inc./OU=IT/CN=ft_services"

RUN usr/bin/ssh-keygen -A

# Nginx config
RUN rm /etc/nginx/nginx.conf
COPY ./nginx.conf /etc/nginx/nginx.conf

COPY setup.sh .

RUN chmod +x setup.sh

EXPOSE 5050
ENTRYPOINT ["./setup.sh", "php-fpm7"]
