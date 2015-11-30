from .base import *

DEBUG = True

INSTALLED_APPS += (
    'debug_toolbar',
)

MIDDLEWARE_CLASSES += (
    'debug_toolbar.middleware.DebugToolbarMiddleware',
)

# Note that django-debug-tool bar does not play nice with docker
# so we overwrite its default behaviour to always show the toolbar
# when the locale settings are loaded in, regardless of IP
DEBUG_TOOLBAR_CONFIG = {
    'SHOW_TOOLBAR_CALLBACK': 'core.settings.local.show_toolbar',
}


def show_toolbar(request):
    if request.is_ajax():
        return False
    return True
