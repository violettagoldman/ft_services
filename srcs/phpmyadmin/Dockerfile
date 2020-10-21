FROM alpine:latest

MAINTAINER Violetta Goldman <vgoldman@student.42.fr>

# Install nginx and its dependencies
RUN apk update && apk add nginx \
&& apk add --no-cache --upgrade bash \
&& apk add openssl && mkdir -p var/run/nginx \
&& apk add openssl openssh \
&& rm -rf /var/cache/apk/* && apk add wget && mkdir /www \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session openrc

RUN mkdir -p /www
COPY ./phpmyadmin /www

# SSL Key
RUN mkdir -p /etc/nginx/ssl && openssl req -newkey rsa:2048 -x509 -days 365 -nodes -keyout /etc/nginx/ssl/services.key -out /etc/nginx/ssl/services.pem -subj "/C=FR/ST=Paris/L=Paris/O=42, Inc./OU=IT/CN=ft_services"

RUN usr/bin/ssh-keygen -A

# Nginx config
RUN rm /etc/nginx/nginx.conf
COPY ./nginx.conf /etc/nginx/nginx.conf

COPY setup.sh .

RUN chmod +x setup.sh

EXPOSE 5000
ENTRYPOINT ["./setup.sh", "php-fpm7"]
