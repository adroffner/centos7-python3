Docker Image: CentOS 7 with Python 3.6
======================================

Create a Python 3.6 image based on the official **centos:7** image.
This is image may be used as a base for others such as a Django project.

Enabled Shared Objects
----------------------

Python has been compiled to enable shared objects to link other programs.
For example, there are Apache **mod_wsgi.so** and **PostgreSQL** python stored procedures.

Enabled SQLite3 Load Extensions
-------------------------------

The **sqlite3** library has a n option to _load extensions_, such as **spatialite**.
This interpreter has this feature available to the programmer.

```python
import sqlite3

# Connect to SQLite and load spatialite module.
conn = sqlite3.connect(':memory:')
conn.enable_load_extension(True)
conn.execute("SELECT load_extension('mod_spatialite')")

# Check that SpatiaLite really works.
for row in conn.execute("SELECT ST_AsText(MakePoint(11.5, 42.5, 4326))"):
    print(row)
```

Apache and MOD WSGI
-------------------

This image may be used as a python Webserver base.
Apache and MOD-WSGI can be built to link with python.
