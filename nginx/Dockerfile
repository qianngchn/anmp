FROM qianngchn/alpine:latest

MAINTAINER Neal Qian <qianngchn@gmail.com>

RUN apk --no-cache add nginx && mkdir -p /run/nginx /var/www/html \
    && chown nobody:nobody /var/lib/nginx \
    && chown nobody:nobody /var/tmp/nginx \
    && chown nobody:nobody /var/www/html \
    && chown nobody:nobody /var/www/localhost/htdocs

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

VOLUME /etc/nginx/conf.d /var/log/nginx /var/www/html /var/www/localhost/htdocs

ENTRYPOINT ["nginx", "-g", "daemon off;"]
