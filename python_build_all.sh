#! /bin/bash
#
# Build Python 3.x.x from source on CentOS Linux.
# =============================================================================
# Assume env. variable PYTHON_VERSION is defined, e.g. PYTHON_VERSION=3.5.2
# =============================================================================

# Install dependencies needed for python
# =============================================================================
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel
yum -y install mysql-devel readline-devel gdbm-devel
# Use alternate: sqlite-devel

yum -y install wget
yum -y groupinstall "Development Tools"

# =============================================================================
# Download and build all binary libraries with dependencies before users.
# =============================================================================

# Download and build sqlite3 *.so $SQLITE_VERSION
# =============================================================================
cd /usr/src

SQLITE_VERSION=3240000

wget https://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_VERSION}.tar.gz
tar -xzf sqlite-autoconf-${SQLITE_VERSION}.tar.gz
cd sqlite-autoconf-${SQLITE_VERSION}

# spatialite needs R-Tree indexes
export CFLAGS="-DSQLITE_ENABLE_RTREE=1"
./configure
make
make install

rm /usr/src/sqlite-autoconf-${SQLITE_VERSION}.tar.gz
rm -R /usr/src/sqlite-autoconf-${SQLITE_VERSION}

# Download and build python interpreter $PYTHON_VERSION
# =============================================================================
cd /usr/src

wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-${PYTHON_VERSION}.tgz
tar -xzf Python-${PYTHON_VERSION}.tgz
cd Python-$PYTHON_VERSION

./configure --enable-shared --enable-ipv6 --enable-loadable-sqlite-extensions
make
make install

rm /usr/src/Python-$PYTHON_VERSION.tgz
rm -R /usr/src/Python-$PYTHON_VERSION
