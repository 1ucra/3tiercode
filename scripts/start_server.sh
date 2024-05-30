#!/bin/bash

sudo su

cd /hellowaws-application-sourcecode/django-community-board-main/

systemctl restart nginx
python3.8 manage.py makemigrations
python3.8 manage.py migrate
python3.8 manage.py runserver 0.0.0.0:8080
