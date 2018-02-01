FROM qianngchn/alpine:latest

MAINTAINER Neal Qian <qianngchn@gmail.com>

RUN apk --no-cache add nginx && mkdir -p /run/nginx /var/www/html \
    && chown root:root /var/lib/nginx \
    && chown root:root /var/tmp/nginx \
    && chown root:root /var/www/html \
    && chown root:root /var/www/localhost/htdocs

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh

EXPOSE 80

VOLUME /etc/nginx/conf.d /var/log/nginx /var/www/html /var/www/localhost/htdocs

ENTRYPOINT ["/entrypoint.sh"]
