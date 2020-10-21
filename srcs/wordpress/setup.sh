#!/bin/sh

rc-service php-fpm7 start

php-fpm7
/usr/sbin/nginx -g 'daemon off;'
