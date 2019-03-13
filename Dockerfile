FROM ubuntu:18.04
LABEL maintainer="kitconcept, GmbH <info@kitconcept.com>"

RUN mkdir -p /plone/docs /plone/logs /plone/.cache /data
ENV PWD=/plone
ENV XDG_CACHE_HOME=/plone/.cache

WORKDIR /plone

RUN apt-get update && apt-get install -y --no-install-recommends python2.7 python-pip
RUN pip install -U setuptools pip virtualenv && virtualenv .

COPY requirements/ /plone/requirements
COPY admin.* /plone/
COPY createsite.py /plone/createsite.py
COPY etc /plone/etc

ENV buildDeps="python-dev build-essential libssl-dev libbz2-dev"
ENV runDeps="libmagic-dev"
RUN apt-get install -y --no-install-recommends $buildDeps && \
    apt-get install -y --no-install-recommends $runDeps && \
    ./bin/pip install -r /plone/requirements/requirements.txt && \
    SUDO_FORCE_REMOVE=yes apt-get purge -y --auto-remove $buildDeps  && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --system -U -u 500 plone && chmod +x admin.sh && \
    chown -R plone:plone /plone/* /plone/.cache /data

USER plone
RUN ./bin/plonecli instance -C /plone/etc/zope.conf run createsite.py

EXPOSE 8080
CMD "/plone/admin.sh"
