# thrid-party imports
from rest_framework import viewsets

# local imports
from .models import Record
from .serializers import RecordSerializer


class RecordViewSet(viewsets.ModelViewSet):
    """CRUD api endpoints for managing records.
    """

    queryset = Record.objects.all().order_by('-created')
    serializer_class = RecordSerializer
