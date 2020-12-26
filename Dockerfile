FROM debian:buster
#update and apgrade
RUN apt-get update && apt-get upgrade -y
#install nginx
RUN apt-get -qq install nginx
#install mariadb
RUN apt-get install mariadb-server mariadb-client -y
#install php-fpm
RUN apt install php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-zip php-curl -y
COPY srcs/*  /
ENTRYPOINT bash /service.sh && bash
