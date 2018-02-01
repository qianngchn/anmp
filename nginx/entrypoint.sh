#!/bin/sh
set -o errexit

FLAGS="$@"

sed -i -e "s/user root root;/user nobody nobody;/g" /etc/nginx/nginx.conf

chown -R nobody:nobody /var/lib/nginx
chown -R nobody:nobody /var/tmp/nginx
chown -R nobody:nobody /var/www/html
chown -R nobody:nobody /var/www/localhost/htdocs

exec nginx -g "daemon off;" $FLAGS

exit 0
