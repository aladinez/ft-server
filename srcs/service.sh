#!/bin/bash
rm /etc/nginx/sites-available/default
mv /default /etc/nginx/sites-available/
service nginx restart
service mysql restart
service php7.3-fpm stop && service php7.3-fpm start
