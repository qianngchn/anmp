FROM qianngchn/alpine:latest

MAINTAINER Neal Qian <qianngchn@gmail.com>

RUN apk --no-cache add certbot && mkdir -p /etc/letsencrypt /var/www/html

COPY entrypoint.sh /entrypoint.sh

VOLUME /etc/letsencrypt /var/www/html

ENTRYPOINT ["/entrypoint.sh"]
