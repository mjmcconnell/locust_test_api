# thrid-party imports
from django.conf.urls import patterns, url

# local imports
from apps.api.views import base


urlpatterns = patterns(
    '',
    url(
        r'^$',
        base.api_root,
        name="api-root",
    ),
)
