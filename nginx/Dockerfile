FROM qianngchn/alpine:latest

MAINTAINER Neal Qian <qianngchn@gmail.com>

RUN apk --no-cache add nginx nginx-mod-http-geoip && mkdir -p /usr/share/GeoIP /run/nginx /var/www/html \
    && wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz \
    && gzip -d GeoIP.dat.gz && mv GeoIP.dat /usr/share/GeoIP \
    && chown -R root:root /var/lib/nginx && chmod 755 /var/lib/nginx \
    && chown -R nobody:root /var/tmp/nginx \
    && chown -R nobody:nobody /var/www/html \
    && chown -R nobody:nobody /var/www/localhost \
    && chown -R nobody:nobody /var/lib/nginx/html

COPY nginx.conf /etc/nginx/nginx.conf
COPY custom.conf /etc/nginx/custom.conf
COPY entrypoint.sh /entrypoint.sh

EXPOSE 80

VOLUME /etc/nginx/conf.d /var/log/nginx /var/www/html /var/www/localhost/htdocs

ENTRYPOINT ["/entrypoint.sh"]
