FROM alpine
MAINTAINER MOSQUITTO Docker Maintainers

RUN set -xe \
    && apk add --no-cache mosquitto

ADD https://raw.githubusercontent.com/zf724/docker-mosquitto/master/mosquitto.conf /root/
ADD https://raw.githubusercontent.com/zf724/docker-mosquitto/master/acl_file /root/
ADD https://raw.githubusercontent.com/zf724/docker-mosquitto/master/password_file /root/

ADD https://raw.githubusercontent.com/zf724/docker-mosquitto/master/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME /data

EXPOSE 1883 1884

ENTRYPOINT ["/entrypoint.sh"]
