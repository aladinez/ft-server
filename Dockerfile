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
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb
RUN echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | debconf-set-selections -v
RUN dpkg -i mysql-apt-config_0.8.13-1_all.deb && apt-get update -y
RUN apt-get install mysql-server -y
#install php-fpm
RUN apt install php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-zip php-curl -y
#install phpmyadmin
RUN apt-get install wget
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar xvf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages /usr/share/phpmyadmin
RUN mkdir -p /var/lib/phpmyadmin/tmp
RUN chown -R www-data:www-data /var/lib/phpmyadmin
RUN cp /config.inc.php /usr/share/phpmyadmin/config.inc.php


COPY srcs/*  /
ENTRYPOINT bash /service.sh && bash
