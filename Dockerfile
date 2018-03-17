FROM ericof/plone:5.1.0

WORKDIR /plone

COPY requirements.docker.txt /plone/requirements.txt
COPY createsite.py /plone/createsite.py

COPY etc /plone/etc
RUN ./bin/pip install -r requirements.txt

USER root
RUN chown -R plone:plone /plone/* /plone/.cache /data

USER plone
RUN ./bin/plonecli instance -C /plone/etc/zope.conf run createsite.py

CMD ["/plone/bin/plonecli", "instance", "-C", "/plone/etc/zope.conf", "fg"]
