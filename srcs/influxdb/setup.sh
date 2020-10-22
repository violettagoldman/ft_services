#!/bin/bash

telegraf &

influxd run -config /etc/influxdb.conf

