#!/bin/bash 

user="root"
dbname="db_wordpress"
name="admin"
pass="admin"

mysql -u $user -e "CREATE DATABASE $dbname;CREATE USER $name@localhost identified by '$pass';GRANT ALL ON *.* to $name@localhost WITH GRANT OPTION;"
#grant all tables on all databases to $name , with ability to grant any other user (with grant optin).

mysql < /usr/share/phpmyadmin/sql/create_tables.sql -u root
mysql < /tmp/db_wordpress.sql -u root db_wordpress
