#!/bin/bash
sudo su
echo "BeforeInstall script started"

python3 -m ensurepip --upgrade

yum install mysql -y
#yum install mysql-devel -y
yum install python-devel -y
#python3 -m pip install pymysql
# export MYSQLCLIENT_CFLAGS=$(/bin/mysql_config --cflags)
# export MYSQLCLIENT_LDFLAGS=$(/bin/mysql_config --libs)

echo "BeforeInstall script completed"