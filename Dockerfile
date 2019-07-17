# Create a abcd docker container 
#
# Note: The resulting container is ~22GB. 
# 
# Example build:
#   docker build --no-cache -t abcd:251 .
#

# Start with debian
FROM debian:stretch-slim
MAINTAINER Feng Xue <xfgavin@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ADD abcddocker_installer.sh /tmp

RUN /tmp/abcddocker_installer.sh 251

ENV NAME "ABCD Processing Pipeline based on MMPS V251"
ENV VER "251_20190710"
ENV MMPSVER "251"
ENV USER "MMPS"
ENV HOME "/home/MMPS"
#############################################################################
#The abcd_init.sh will creat an MMPS user with uid equals current user
#So data should be mounted to /home/MMPS
#############################################################################

ENTRYPOINT ["/usr/pubsw/packages/MMPS/MMPS_251/sh/abcd_init.sh"]
ENV DEBIAN_FRONTEND teletype
