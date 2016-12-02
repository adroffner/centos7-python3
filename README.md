Docker Image: CentOS 7 with Python 3.5
======================================

Create a Python 3.5 image based on the official  **centos:7** image.
This is image may be used as a base for others such as a Django project.

Enabled Shared Objects
----------------------

Python has been compiled to enable shared objects to link other programs.
For example, there are Apache **mod_wsgi.so** and **PostgreSQL**python stored procedures.

Apache and MOD WSGI
-------------------

This image may be used as a python Webserver base.
Apache and MOD-WSGI can be built to link with python.
