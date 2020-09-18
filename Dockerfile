# docker의 베이스 이미지
FROM ubuntu:18.04

LABEL maintainer="isoyeong666@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Image for the RTOS"

WORKDIR /navilos-app

# Update Ubuntu Software repository
RUN apt-get update
RUN apt-get install -y nano

# install gcc compiler
RUN apt-get install -y gcc-arm-none-eabi
# install QEMU emulator
RUN apt-get install -y qemu-system-arm

#
#RUN chmod +x ./wait-for-it.sh
## # aws cli 설치
#RUN apt-get update && apt-get install awscli -y
#
#COPY ./django-dashboard/manage.py ./django-dashboard/gunicorn-cfg.py ./django-dashboard/requirements.txt /crawler-app/django-dashboard/
#
#WORKDIR /crawler-app/django-dashboard
#
## 가상환경(virtualenv)과 django 설치
#RUN pip install virtualenv && virtualenv /crawler-app/django-dashboard/live-venv
## RUN pip install -r requirements.txt
#
#EXPOSE 3000