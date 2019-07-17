# Create a base abcd docker container 
#
# Note: The resulting container is ~8GB. 
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


    #&& find /usr/pubsw/packages/MMPS/ \( -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.m' -o -name '*.asv' -o -name '*.def' -o -name '*.vcproj' -o -name '*.old' -o -name '*.bak' -o -name '*.swp' -o -name '*.notes' -o -name '*.m~' -o -name CONTENTS -o -name 'README*' -o -name .xdebug_tkmedit -o -name '*.java' -o -name '*.cc' \) -delete \
    #&& find /usr/pubsw/packages/MMPS/external/external.*/matlab/Projects \( -name '*.sh' -o -name '*.xml' \) -delete \
    #&& find /usr/pubsw/packages/MMPS/external/ -name '*.doc' -delete
# Configure license 
#COPY license /opt/freesurfer/.license

#COPY ./*.sh /usr/pubsw/packages/MMPS/MMPS_251/sh/

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
