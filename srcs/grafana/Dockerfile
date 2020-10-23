FROM alpine:latest

MAINTAINER Violetta Goldman <vgoldman@student.42.fr>

RUN apk update && apk add --no-cache --upgrade bash \
&& apk add --no-cache libc6-compat wget

# Install telegraf
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN wget https://dl.grafana.com/oss/release/grafana-6.7.2.linux-amd64.tar.gz \
&& tar -zxvf grafana-6.7.2.linux-amd64.tar.gz

COPY ./grafana.db ./grafana-6.7.2/data/
COPY setup.sh .
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

RUN chmod +x setup.sh

EXPOSE 3000
ENTRYPOINT ["./setup.sh"]
