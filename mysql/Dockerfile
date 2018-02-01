FROM qianngchn/alpine:latest

MAINTAINER Neal Qian <qianngchn@gmail.com>

RUN apk --no-cache add mysql mysql-client && mkdir -p /run/mysqld \
    && chown -R root:root /etc/mysql/my.cnf \
    && chown -R root:root /var/lib/mysql

COPY entrypoint.sh /entrypoint.sh

EXPOSE 3306

VOLUME /var/lib/mysql

ENTRYPOINT ["/entrypoint.sh"]
