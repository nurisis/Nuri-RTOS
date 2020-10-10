# docker의 베이스 이미지
FROM ubuntu:18.04

LABEL maintainer="isoyeong666@gmail.com"
LABEL version="0.2"
LABEL description="This is custom Docker Image for the RTOS"

WORKDIR /navilos-app

# Update Ubuntu Software repository
RUN apt-get update
RUN apt-get install -y nano
RUN apt-get install -y make

# install gcc compiler
RUN apt-get install -y gcc-arm-none-eabi
# install QEMU emulator
RUN apt-get install -y qemu-system-arm
