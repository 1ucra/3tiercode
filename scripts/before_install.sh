#!/bin/bash
echo "BeforeInstall script started"
sudo yum install mariadb-client -y
rm -rf /hellowaws-application-sourcecode/django-community-board-main/*
echo "BeforeInstall script completed"