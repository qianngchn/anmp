#!/bin/sh

chown -R root:root /var/log/php7
chown -R nobody:nobody /var/www/html
chown -R nobody:nobody /var/www/localhost/htdocs

exec php-fpm7 -F

exit 0
