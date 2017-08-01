#!/bin/bash

pushd ../reactive-syslog-server && git pull origin master && ./mvnw clean package && popd
bosh add-blob ../reactive-syslog-server/target/reactive-syslog-server-0.0.1-SNAPSHOT.jar reactive-syslog-server/reactive-syslog-server-0.0.1-SNAPSHOT.jar
bosh create-release --force --tarball=/tmp/foo.tgz
bosh upload-release /tmp/foo.tgz
bosh deploy -d reactive-syslog-server reactive-syslog-server.yml -v internal_ip=10.244.0.230
