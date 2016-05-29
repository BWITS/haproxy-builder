# A docker container to build haproxy stable version RPM on CentOS

The resulting RPM will be in image's /root/rpmbuild/RPMS/x86_64

### Why need haproxy builder?

* There is no exist RPM for you to download from www.haproxy.org
* Some online documents teach you how to install latest haproxy in centos step-by-step, which you need spend time to follow up.
* Several github repos make the scripts to help you to build the RPM by yourself 

The way I provision makes the whole processes easier. I use hub.docker.com as repo server. You can download haproxy RPM directly.  

This is a generic way for any packages if you need build from source codes.

### Get the RPM

1. Install Docker (https://docs.docker.com/engine/installation/)
2. Check which version can be downloaded at https://hub.docker.com/r/bwits/haproxy/tags/
3. update the version in `download.sh`
4. download the RPM file

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
### How to support

1. When there are new stable versions at http://www.haproxy.org/, you can raise PR to update the related Dockerfile, normally simply update the environment `version` is enough.
2. set the tag on this new commit
3. trigger a new build at hub.docker.com

