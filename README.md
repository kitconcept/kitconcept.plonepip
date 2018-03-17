# Plone installed via pip

Inspired by Asko Soukka's

https://github.com/datakurre/plone-pip

# Installation

```
$ virtualenv .
$ ./bin/pip install -U pip setuptools
```

```
$ ./bin/pip install -r requirements.txt -r requirements.5.1.txt
```

Init ZODB with admin:admin user

```
$ ./bin/plonecli instance -C zope.conf run admin.py
```

Create a new site programmatically

```
$ ./bin/plonecli instance -C zope.conf run createsite.py
```

# Serving Plone
```
$ ./bin/plonecli instance -C zope.conf fg
```

# Installing existing add-on

$ ./bin/pip install collective.easyform
$ ./bin/pip install plone.app.imagecropping

# Developing a new add-on

```
$ source env/bin/activate
$ plonecli create addon my.addon
$ cd my.addon
$ python setup.py develop
```

# Docker image

Inspired by Erico Andrei and based on https://github.com/ericof/docker-plone

It has installed the last plone.restapi version ready to use.

# docker build .
