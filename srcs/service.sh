#!/bin/bash
rm /etc/nginx/sites-available/default
mv /default /etc/nginx/sites-available/
echo "<?php phpinfo( ); ?>" >> /var/www/html/phpinfo.php
echo "<h1>helloooo</h1>" >> /var/www/html/alae.html
service nginx restart
service mysql restart
service php7.3-fpm stop && service php7.3-fpm start
