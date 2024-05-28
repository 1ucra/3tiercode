#!/bin/bash

sudo su

cd /hellowaws/django-community-board-main/

systemctl restart nginx
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:8080
