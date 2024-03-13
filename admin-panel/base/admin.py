from django.contrib import admin

# Register your models here.
from base.models import (
    Domain,
    InfoType,
)

admin.site.register(Domain)
admin.site.register(InfoType)

