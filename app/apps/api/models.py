# third-party imports
from django.db import models


class BaseModel(models.Model):
    """generic properties and functionality for all models"""

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


class Record(BaseModel):

    label = models.CharField(max_length=500)
