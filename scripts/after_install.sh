#!/bin/bash

sudo su

cd /hellowaws-application-sourcecode/django-community-board-main/

hostname=$(hostname)
export hostname
envsubst < ./templates/index.html.template > ./templates/index.html

