#!/usr/bin/env bash

# Copy the haproxy RPM to local directly

tag=1.6.5
centos=centos7

id=$(docker create bwits/haproxy:${centos}-v${tag})
docker cp $id:/root/rpmbuild/RPMS/x86_64/haproxy-${tag}-1.x86_64.rpm .
docker rm -v $id

# You can delete the image to release the space, uncomment below line
# docker rmi -f bwits/haproxy:${centos}-v${tag}

ls -l haproxy-${tag}-1.x86_64.rpm
