FROM debian:buster
#set env as noninteractivemode
ARG DEBIAN_FRONTEND=noninteractive
#update and apgrade
RUN apt-get update && apt-get upgrade -y
#install nginx
RUN apt-get -qq install nginx
#install mysql
#first install gnupq and lsb-release
RUN apt-get install -y lsb-release
RUN apt-get install -y gnupg
RUN apt-get install -y wget
RUN echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | debconf-set-selections
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.16-1_all.deb
RUN dpkg -i mysql-apt-config* && apt-get update -y
RUN apt-get install mysql-server -y

#install php-fpm
RUN apt install php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-zip php-curl -y

#install phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar xvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages /usr/share/phpmyadmin
RUN mkdir -p /var/lib/phpmyadmin/tmp
RUN chown -R www-data:www-data /var/lib/phpmyadmin
RUN ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin


COPY srcs* /
RUN cp /config.inc.php /usr/share/phpmyadmin/config.inc.php
ENTRYPOINT bash /service.sh && bash /mysql.sh && bash

#version 5.7
#update and install 
#echo "0000\r"
#echo "0000\r"
#service mysql start

