# A docker container to build haproxy stable version RPM on CentOS

The resulting RPM will be in image's /root/rpmbuild/RPMS/x86_64

### Get the RPM

1. update the version in `download.sh`
2. download the RPM file

    ./download.sh

### Build the docker image by yourself and copy the rpm out.
```
# for example, you'd like to build for haproxy v1.6.5 on centos 7
git clone https://github.com/BWITS/haproxy-builder.git

cd  haproxy-centos7-v1.6

# adjust the version in Dockerfile if new version on the market.

tag=1.6.5
centos=7

docker build -t haproxy:centos${centos}-v{tag} .

id=$(docker create haproxy:${centos}-v${tag})
docker cp $id:/root/rpmbuild/RPMS/x86_64/haproxy-${tag}-1.x86_64.rpm .
docker rm -v $id

# You can delete the image to release the space, uncomment below line
# docker rmi -f bwits/haproxy:${centos}-v${tag}

ls -l haproxy-${tag}-1.x86_64.rpm
```
