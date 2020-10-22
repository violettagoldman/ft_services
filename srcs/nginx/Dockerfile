FROM alpine:latest

MAINTAINER Violetta Goldman <vgoldman@student.42.fr>

# Install nginx and its dependencies
RUN apk update && apk add nginx \
&& apk add --no-cache --upgrade bash \
&& apk add openssl && mkdir -p var/run/nginx \
&& apk add openssl openssh \
&& rm -rf /var/cache/apk/*

# Install telegraf
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p /www
COPY ./index.html /www
COPY telegraf.conf /etc/telegraf/telegraf.conf

# SSL Key
RUN mkdir -p /etc/nginx/ssl && openssl req -newkey rsa:2048 -x509 -days 365 -nodes -keyout /etc/nginx/ssl/services.key -out /etc/nginx/ssl/services.pem -subj "/C=FR/ST=Paris/L=Paris/O=42, Inc./OU=IT/CN=ft_services"

RUN usr/bin/ssh-keygen -A
COPY sshd_config /etc/ssh/

# Nginx config
RUN rm /etc/nginx/nginx.conf
COPY ./nginx.conf /etc/nginx/nginx.conf

RUN echo 'Welcome to ft_services by vgoldman' > /etc/motd

COPY setup.sh .

RUN chmod +x setup.sh

EXPOSE 80 443 22
CMD ./setup.sh
