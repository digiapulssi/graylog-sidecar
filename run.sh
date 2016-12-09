#!/bin/bash
docker run --link graylog2 --name graylog_sidecar \
--env-file ./env.list \
-v /var/log:/host/var/log:ro \
-v /home/teemu/log:/host/home/teemu/log:ro \
-d registry.pulssi.digia.com/digiapulssi/graylog_sidecar
