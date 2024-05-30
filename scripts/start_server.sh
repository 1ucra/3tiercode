#!/bin/bash

cd /hellowaws-application-sourcecode/django-community-board-main/

# 필요한 시스템 패키지 설치
sudo yum install mysql-devel -y  # CentOS/RHEL
# sudo apt-get install libmysqlclient-dev -y  # Ubuntu/Debian (주석 해제 필요)

# 가상 환경 생성 및 활성화
python3 -m venv venv
source venv/bin/activate

# 가상 환경이 올바르게 활성화되었는지 확인
echo "Python interpreter location:"
which python

# pip 업그레이드 및 패키지 설치
python3 -m pip install --upgrade pip

# 패키지 개별 설치 및 오류 확인
python3 -m pip install django==3.2.25
python3 -m pip install asgiref==3.7.2
python3 -m pip install sqlparse==0.4.4
python3 -m pip install mysqlclient>=2.1.0
python3 -m pip install pkgconfig==1.5.5
python3 -m pip install django-redis==5.3.0

# nginx 서비스 재시작
sudo systemctl restart nginx

# Django 마이그레이션 및 서버 실행
echo "Python interpreter location after reactivation:"
which python
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:8080
