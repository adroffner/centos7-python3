#! /bin/bash
#
# Build Python 3.x.x from source on CentOS Linux.
# =============================================================================
# Assume env. variable PYTHON_VERSION is defined, e.g. PYTHON_VERSION=3.5.2
# =============================================================================

# Install dependencies needed for python
# =============================================================================
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel
yum -y install sqlite-devel mysql-devel readline-devel gdbm-devel

yum -y install install wget
yum -y groupinstall "Development Tools"

# Download and build python interpreter $PYTHON_VERSION
# =============================================================================
cd /usr/src

wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-${PYTHON_VERSION}.tgz
tar -xzf Python-${PYTHON_VERSION}.tgz
cd Python-$PYTHON_VERSION

./configure --enable-shared --enable-ipv6
make
make install

rm /usr/src/Python-$PYTHON_VERSION.tgz
rm -R /usr/src/Python-$PYTHON_VERSION

