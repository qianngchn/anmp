FROM qianngchn/alpine:latest

MAINTAINER Neal Qian <qianngchn@gmail.com>

RUN apk --no-cache add php7 php7-common php7-fpm php7-opcache \
    php7-ctype php7-tidy php7-calendar php7-iconv php7-sysvshm \
    php7-gettext php7-mbstring php7-bcmath php7-gd php7-exif \
    php7-session php7-sockets php7-imap php7-soap php7-ldap \
    php7-sqlite3 php7-odbc php7-dba php7-pdo php7-pdo_mysql \
    php7-intl php7-dom php7-xml php7-simplexml php7-json \
    php7-mysqli php7-mysqlnd php7-mcrypt php7-openssl \
    php7-curl php7-phar php7-zlib php7-bz2 php7-zip \
    && mkdir -p /var/log/php7 /var/www/html /var/www/localhost/htdocs \
    && chown -R root:root /var/log/php7 \
    && chown -R nobody:nobody /var/www/html \
    && chown -R nobody:nobody /var/www/localhost

COPY php.ini /etc/php7/php.ini
COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf
COPY entrypoint.sh /entrypoint.sh

VOLUME /var/log/php7 /var/www/html /var/www/localhost/htdocs

EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]
