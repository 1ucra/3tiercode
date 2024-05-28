#!/bin/bash

sudo su

cd /hellowaws/django-community-board-main/

hostname=$(hostname)
export hostname
envsubst < ./templates/index.html.template > ./templates/index.html

db_user_id=$(aws ssm get-parameter --name "/config/account/admin/ID" --with-decryption --query "Parameter.Value" --output text)
db_user_pwd=$(aws ssm get-parameter --name "/config/account/admin/PWD" --with-decryption --query "Parameter.Value" --output text)
aurora_endpoint=$(aws ssm get-parameter --name "/config/system/db-cluster-endpoint" --with-decryption --query "Parameter.Value" --output text)
redis_endpoint=$(aws ssm get-parameter --name "/config/system/redis-cluster-endpoint" --with-decryption --query "Parameter.Value" --output text)
export db_user_id
export db_user_pwd
export aurora_endpoint
export redis_endpoint

envsubst < ./templates/nodbsettings.py.template > ./community_board_project/settings.py
