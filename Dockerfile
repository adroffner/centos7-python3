# CentOS 7 with Python 3.6 on Docker
# =============================================================================
FROM dockercentral.it.att.com:5100/com.att.dev.argos/centos:7

# Set the Python 3.x.x version.
# =============================================================================
ENV PYTHON_VERSION="3.6.6"

# HTTP Proxy Settings
ENV http_proxy="http://one.proxy.att.com:8080"
ENV https_proxy="http://one.proxy.att.com:8080"
ENV HTTP_PROXY="http://one.proxy.att.com:8080"
ENV HTTPS_PROXY="http://one.proxy.att.com:8080"

# Update CentOS 7 per Docker advice.
RUN yum -y update

WORKDIR /root/python-workspace

# Set Locale to US English.
RUN localedef  -c -i en_US -f UTF-8 en_US.UTF-8 || /bin/true
ENV LC_ALL "en_US.UTF-8"

# Download and build python 3.x.x
COPY ./python_build_all.sh .
RUN  ./python_build_all.sh

# Add python shared libs to the path.
COPY python3-x86_64.conf /etc/ld.so.conf.d/
RUN ldconfig -v

# Upgrade pip.
RUN /usr/local/bin/pip3 install --upgrade pip

RUN yum -y clean all

# Unprivileged User: "docker" runs entrypoint.
RUN useradd -r docker

# Start an "application container"
ENTRYPOINT ["su", "docker", "-c", "/usr/local/bin/python3"]

