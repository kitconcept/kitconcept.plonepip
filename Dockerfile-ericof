FROM ericof/plone:5.1.0
LABEL maintainer="kitconcept, GmbH <info@kitconcept.com>"

WORKDIR /plone

COPY --chown=plone:plone requirements.docker.txt /plone/requirements.txt
COPY --chown=plone:plone createsite.py /plone/createsite.py
COPY --chown=plone:plone etc /plone/etc

USER root
RUN mkdir /plone/docs && chown plone:plone /plone/docs

USER plone
RUN ./bin/pip install -r requirements.txt && ./bin/plonecli instance -C /plone/etc/zope.conf run createsite.py

# CMD ["/plone/bin/plonecli", "instance", "-C", "/plone/etc/zope.conf", "fg"]
