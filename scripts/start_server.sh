#!/bin/bash

cd /hellowaws-application-sourcecode/django-community-board-main/

# 가상 환경 생성 및 활성화
python3 -m venv venv
source venv/bin/activate
export PATH=$PATH:/usr/local/bin
python3 -m pip install --upgrade pip

# 패키지 설치 및 오류 확인
install_package() {
    PACKAGE=$1
    echo "Installing $PACKAGE..."
    if python3 -m pip install $PACKAGE; then
        echo "$PACKAGE installed successfully."
    else
        echo "Failed to install $PACKAGE."
        exit 1
    fi
}

install_package django==3.2.25
install_package asgiref==3.7.2
install_package sqlparse==0.4.4
install_package mysqlclient
install_package pkgconfig==1.5.5
install_package django-redis==5.3.0

# nginx 서비스 재시작
systemctl restart nginx

# Django 마이그레이션 및 서버 실행

python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:8080
