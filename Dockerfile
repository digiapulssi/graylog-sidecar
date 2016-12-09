#########################
# graylog sidecar       #
#########################
FROM ubuntu:latest
MAINTAINER Teemu Hautala <teemu.hautala@digia.com>
ADD ./data /data
RUN apt-get update && apt-get install -y openssl libapr1 libdbi1 libexpat1 && dpkg -i /data/collector-sidecar_0.1.0-1_amd64.deb
CMD /data/start.sh
