#! /bin/sh
set -e

chown mosquitto:mosquitto /data

if [ ! -f "/data/mosquitto.conf" ];then
  mv /root/mosquitto.conf /data/
  mv /root/acl_file /data/
  mv /root/password_file /data/
  chown mosquitto:mosquitto /data/*
fi

exec mosquitto -c /data/mosquitto.conf
