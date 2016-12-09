# graylog_sidecar
Docker image for Graylog Sidecar Collector using filebeat

Usage: 

The container uses environment variables to define the logfiles that are monitored and connection settings to the server running Graylog. Following parameters are needed:

- GS_SERVER_URL
 - Graylog server url to connect to 
- GS_UPDATE_INTERVAL
 - seconds interval on how often the configuration is retrieved from Graylog server
- GS_LIST_LOG_FILES
 - list of paths that contain the log files that need to be monitored
- GS_NODE_ID
 - Graylog Sidecar instance name
- GS_TAGS 
 - Tags that are to be monitored (retrieved from Graylog server)

Also, the monitored folder needs to be mounted for the docker container. E.g. if you want to monitor host location /var/log/apache2, you should mount it as follows:

docker run --env-file ./env.list -v /var/log/apache2:/host/var/log:ro -d registry.pulssi.digia.com/digiapulssi/graylog_sidecar

Example configuration: 

GS_SERVER_URL=http://graylog2:9000/api/  
GS_UPDATE_INTERVAL=10  
GS_LIST_LOG_FILES=['/host/var/log/apache2']  
GS_NODE_ID=graylog-collector-sidecar-docker  
GS_TAGS=['apache2']  

Since Graylog Sidecar retrieves it's configuration from Graylog server, a matching configuration needs to exist in the server side. In particular, each tag that is configured in the GS_TAGS variable needs to exist in the Graylog server Collectors configuration.
