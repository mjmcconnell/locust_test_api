from .base import *

DEBUG = True

INSTALLED_APPS += (
    'debug_toolbar',
)

MIDDLEWARE_CLASSES += (
    'debug_toolbar.middleware.DebugToolbarMiddleware',
)

# django-debug-toolbar settings
INTERNAL_IPS = ('127.0.0.1', '0.0.0.0')
