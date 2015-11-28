# third-party imports
from rest_framework import serializers

# local imports
from .models import Record


class BaseSerializer(serializers.HyperlinkedModelSerializer):

    created = serializers.DateTimeField(read_only=True)
    updated = serializers.DateTimeField(read_only=True)


class RecordSerializer(BaseSerializer):

    label = serializers.CharField()

    class Meta:
        model = Record
        fields = ('url', 'id', 'label', 'created', 'updated')
        extra_kwargs = {
            'url': {'view_name': 'api:record-detail', 'lookup_field': 'pk'}
        }
