FROM alpine:latest

MAINTAINER Violetta Goldman <vgoldman@student.42.fr>

# Install telegraf
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN apk add --no-cache vsftpd openssl openrc

RUN openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -subj "/C=FR/ST=fr/L=Paris/O=School42/CN=ft_services" -keyout /etc/ssl/certs/vsftpd.pem -out /etc/ssl/certs/vsftpd.pem

RUN chmod 755 /etc/ssl/certs/vsftpd.pem

ADD vsftpd.conf /etc/vsftpd/vsftpd.conf
ADD setup.sh /

RUN chmod 775 setup.sh

COPY telegraf.conf /etc/telegraf/telegraf.conf

VOLUME /ftp/ftp

EXPOSE 21 2121 2122 2123

CMD	/setup.sh
