#!/bin/bash
sudo su
echo "BeforeInstall script started"

amazon-linux-extras enable python3.8
yum install python3.8 -y
alternatives --set python /usr/bin/python3.8
python3.8 -m ensurepip --upgrade

yum install mysql -y
yum install mysql-devel -y
yum install python38-devel -y
python3.8 -m pip install pymysql
export MYSQLCLIENT_CFLAGS=$(/bin/mysql_config --cflags)
export MYSQLCLIENT_LDFLAGS=$(/bin/mysql_config --libs)

echo "BeforeInstall script completed"