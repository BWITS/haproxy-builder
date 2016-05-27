FROM centos:6

ENV branch 1.5
ENV version 18
ENV release 1

RUN yum -y update
RUN yum install -y rpm-build rpmdevtools pcre-devel openssl-devel zlib-devel redhat-rpm-config gcc gcc-c++ make libstdc++-devel wget rpmlint vim
RUN rpmdev-setuptree
RUN wget http://www.haproxy.org/download/${branch}/src/haproxy-${branch}.${version}.tar.gz
RUN gtar zxvf haproxy-${branch}.${version}.tar.gz haproxy-${branch}.${version}/examples/*
RUN cp haproxy-${branch}.${version}/examples/auth.cfg /root/rpmbuild/SOURCES/haproxy.cfg
RUN cp haproxy-${branch}.${version}/examples/haproxy.init /root/rpmbuild/SOURCES/haproxy.init
RUN cp haproxy-${branch}.${version}/examples/haproxy.spec /root/rpmbuild/SPECS/haproxy.spec
RUN mv haproxy-${branch}.${version}.tar.gz /root/rpmbuild/SOURCES/haproxy-${branch}.${version}.tar.gz
WORKDIR /root/rpmbuild
RUN rpmbuild -ba SPECS/haproxy.spec
