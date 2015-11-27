"""Url routing for all local apps
"""
# third party imports
from django.conf.urls import url, include
from rest_framework import routers

# local imports
from apps.api import views

router = routers.DefaultRouter()
router.register(r'records', views.RecordViewSet)

# Wire up our API using automatic URL routing.
urlpatterns = [
    url(r'^', include(router.urls)),
]
