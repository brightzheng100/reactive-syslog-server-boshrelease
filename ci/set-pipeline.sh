#!/bin/sh

echo y | fly -t home set-pipeline -p reactive-syslog-server-boshrelease -c pipeline.yml -l credentials.yml