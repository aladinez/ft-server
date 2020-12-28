#!/bin/bash 

user="root"
dbname="db_wordpress"
name="admin"
pass="admin"

mysql -u $user -e "CREATE DATABASE $dbname;CREATE USER $name@localhost identified by '$pass';GRANT ALL ON *.* to $name@localhost WITH GRANT OPTION;"
