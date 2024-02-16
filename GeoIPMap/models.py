from django.db import models
from django.utils import timezone

from django_countries.fields import CountryField

class Tracker(models.Model):
    deviceID = models.CharField(max_length=100)
    location = models.CharField(max_length=100)
    logtime = models.TimeField()
    class Meta:
        db_table = "tracker"


