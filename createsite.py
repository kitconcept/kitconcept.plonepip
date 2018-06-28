from Products.CMFPlone.factory import addPloneSite

import transaction

default_extension_profiles = (
    'plone.app.caching:default',
    'plonetheme.barceloneta:default',
    'collective.folderishtypes.dx:default',
    'plone.restapi:default'
)

addPloneSite(app, 'Plone', extension_ids=default_extension_profiles)

transaction.commit()
