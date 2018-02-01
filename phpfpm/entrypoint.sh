#!/bin/sh
set -o errexit

FLAGS="$@"

chown -R root:root /var/log/php7
chown -R nobody:nobody /var/www/html
chown -R nobody:nobody /var/www/localhost/htdocs

exec php-fpm7 -F $FLAGS

exit 0
