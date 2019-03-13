from plone import api
from plone.dexterity.interfaces import IDexterityFTI
from Products.CMFPlone.factory import addPloneSite
from zope.component import queryUtility

import transaction


default_extension_profiles = (
    'plone.app.caching:default',
    'plonetheme.barceloneta:default',
    'collective.folderishtypes.dx:default',
    'plone.restapi:default',
    'kitconcept.voltodemo:default'
)

addPloneSite(app, 'Plone', extension_ids=default_extension_profiles)

# Remove non-folder types from navigation
api.portal.set_registry_record(name="plone.nonfolderish_tabs", value=False)

# Add Tiles behavior to Document FTI
fti = queryUtility(IDexterityFTI, name='Document', context=app['Plone'])
behavior_list = [a for a in fti.behaviors]
behavior_list.append('plone.tiles')
fti.behaviors = tuple(behavior_list)

transaction.commit()
