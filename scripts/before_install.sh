#!/bin/bash
sudo su
echo "BeforeInstall script started"

python3 -m ensurepip --upgrade
amazon-linux-extras install nginx1
sudo systemctl start nginx
sudo systemctl enable nginx

yum install gcc -y
yum install mysql-devel -y
yum install python3-devel -y

echo "BeforeInstall script completed"