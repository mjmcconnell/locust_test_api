"""
WSGI config for app project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/howto/deployment/wsgi/
"""
# thrid-party imports
from django.core.wsgi import get_wsgi_application

# local imports
from core.utils import set_env_vars


# Set the apps environment variables based of the `.env` file, if one exists
set_env_vars()

application = get_wsgi_application()
