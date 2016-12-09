#!/bin/bash
docker stop graylog_sidecar
docker rm graylog_sidecar
docker rmi digiapulssi/graylog_sidecar
