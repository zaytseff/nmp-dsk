#!/bin/sh

chgrp -R www-data /var/www/html
chmod u+rwx,g+rx,o+rx /var/www/html
find /var/www/html -type d -exec chmod u+rwx,g+rx,o+rx {} +
find /var/www/html -type f -exec chmod u+rw,g+rw,o+r {} +
