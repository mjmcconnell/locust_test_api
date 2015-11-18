"""app URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
"""
# third-part imports
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^', include('apps.api.urls', namespace='api')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^docs/', include('rest_framework_swagger.urls')),
    url(
        r'^api-auth/',
        include('rest_framework.urls', namespace='rest_framework')
    )
]
