FROM centos:centos7.4.1708

####################################################################
# Testing update
####################################################################
#author
MAINTAINER Natsu
#metadata
LABEL version="0.1"
LABEL description="Building Environments of OpenCL with Dockerfile"

####################################################################
# OS Update Freezing
####################################################################
RUN echo 7.4.1708 > /etc/yum/vars/releasever
RUN sed -i".org" -e "s/^mirror/#mirror/" \
                  -e "s/^#baseurl/baseurl/g" \
                  -e "s/mirror.centos/vault.centos/g" \
                  /etc/yum.repos.d/CentOS-Base.repo



####################################################################
# Yum Update
####################################################################
RUN yum update -y 

####################################################################
# System Dependencies
####################################################################
RUN yum install -y \
  vim \
  wget \
  yum-utils \
  https://centos7.iuscommunity.org/ius-release.rpm \
  python36u \
  python36u-pip \
  python36u-devel

####################################################################
# Download with wget or curl
####################################################################
RUN mkdir -p /tmp/work/download
COPY download.sh /tmp/work/download
