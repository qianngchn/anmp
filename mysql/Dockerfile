FROM qianngchn/alpine:latest

MAINTAINER Neal Qian <qianngchn@gmail.com>

RUN apk --no-cache add mysql mysql-client && mkdir -p /run/mysqld /var/log/mysql \
    && chown nobody:nobody /run/mysqld && chown nobody:nobody /var/log/mysql \
    && chown root:root /etc/mysql/my.cnf

COPY entrypoint.sh /entrypoint.sh

EXPOSE 3306

VOLUME /var/log/mysql /var/lib/mysql

ENTRYPOINT ["/entrypoint.sh"]
