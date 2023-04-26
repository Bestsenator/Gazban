from django.contrib import admin
from .models import *
# Register your models here.

admin.site.register(API_KEYS)
admin.site.register(GasEmployee)
admin.site.register(Representative)
admin.site.register(Rescuer)
admin.site.register(HeadArea)
admin.site.register(HeadCity)
admin.site.register(HeadRelief)
admin.site.register(DailyRequest)
admin.site.register(HourlyRequest)
