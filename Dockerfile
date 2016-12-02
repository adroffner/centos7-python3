# CentOS 7 with Python 3.5 on Docker
# =============================================================================
FROM centos:7
MAINTAINER "Andrew Droffner" <ad718x@att.com>

# Set the Python 3.5.x version.
# =============================================================================
ENV PYTHON_VERSION="3.5.2"

# HTTP Proxy Settings
ENV http_proxy="http://one.proxy.att.com:8080"
ENV https_proxy="http://one.proxy.att.com:8080"
ENV HTTP_PROXY="http://one.proxy.att.com:8080"
ENV HTTPS_PROXY="http://one.proxy.att.com:8080"

WORKDIR /root/python-workspace

# Update CentOS 7 per Docker advice.
RUN yum -y update

# Download and build python 3.5.x
ENV LC_ALL C
COPY ./python_build_all.sh .
RUN  ./python_build_all.sh

# Add python shared libs to the path.
COPY python3-x86_64.conf /etc/ld.so.conf.d/
RUN ldconfig -v

# Upgrade pip.
/usr/local/bin/pip3 install --upgrade pip

RUN yum -y clean all

# Do we even need to start an "application container"?
ENTRYPOINT ["/usr/local/bin/python3"]

