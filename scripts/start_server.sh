#!/bin/bash

cd /hellowaws-application-sourcecode/django-community-board-main/

# 가상 환경 생성 및 활성화
python3 -m venv venv
source venv/bin/activate
export PATH=$PATH:/usr/local/bin
python3 -m pip install --upgrade pip
python3 -m pip install --no-cache-dir -r ./requirements.txt
# nginx 서비스 재시작
systemctl restart nginx

# Django 마이그레이션 및 서버 실행
python3 manage.py makemigrations
python3 manage.py migrate
nohup python3 manage.py runserver 0.0.0.0:8080 &
