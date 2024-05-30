#!/bin/bash

sudo su

cd /hellowaws-application-sourcecode/django-community-board-main/
python3 -m venv venv
source venv/bin/activate
echo "Python interpreter location:"
which python

python3 -m pip install --upgrade pip
python3 -m pip install --no-cache-dir -r ./requirements.txt

systemctl restart nginx
source venv/bin/activate
echo "Python interpreter location:"
which python
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:8080
