#!/bin/sh
set -o errexit

FLAGS="$@"

sed -i -e "s/user = root/user = nobody/g" /etc/php7/php-fpm.d/www.conf
sed -i -e "s/group = root/group = nobody/g" /etc/php7/php-fpm.d/www.conf

chown -R nobody:nobody /var/www/html
chown -R nobody:nobody /var/www/localhost/htdocs

exec php-fpm7 -F $FLAGS

exit 0
