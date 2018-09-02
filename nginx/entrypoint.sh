#!/bin/sh

chown -R root:root /etc/nginx/conf.d
chown -R root:root /var/log/nginx
chown -R nobody:nobody /var/www/html
chown -R nobody:nobody /var/www/localhost/htdocs

exec nginx -g "daemon off;"

exit 0
