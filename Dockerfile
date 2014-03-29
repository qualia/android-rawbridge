# BUILD-USING:        docker build -t qualia/android-rawbridge .
# RUN-USING:          docker run -i -name rawbridge qualia/android-rawbridge && docker wait rawbridge && docker cp rawbridge:/root/app/rawbridge . && docker rm rawbridge

FROM          ubuntu:12.04
RUN           DEBIAN_FRONTEND=noninteractive apt-get update -y
MAINTAINER    Drew Carey Buglione <me@drewb.ug>
WORKDIR       root

RUN           DEBIAN_FRONTEND=noninteractive apt-get install -y gcc-arm-linux-gnueabi

ADD           . /root/app
WORKDIR       /root/app
CMD           arm-linux-gnueabi-gcc -static rawbridge.c -o rawbridge
