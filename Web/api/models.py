import random
import secrets

import jdatetime
import pytz
from django.contrib.postgres.fields import ArrayField
import datetime
from django.db import models
from django_jalali.db import models as jmodels
# Create your models here.


def getRandomInt():
    return random.randint(123456, 999999)


def getDateTime():
    return str(jdatetime.datetime.today())


def getToken():
    return secrets.token_urlsafe(80)


class API_KEYS(models.Model):
    API_KEY = models.CharField(max_length=110, default=getToken)
    Hash = models.CharField(max_length=150)
    PermissionAddAPI = models.BooleanField(default=False)
    PermissionListApi = models.BooleanField(default=False)


class GasEmployee(models.Model):  # گازبان
    PeCode = models.IntegerField(default=getRandomInt)
    Name = models.CharField(max_length=150)
    Family = models.CharField(max_length=150)
    NationalCode = models.CharField(max_length=15)
    ListOfPhone = ArrayField(models.CharField(max_length=12), size=10, default=list)
    Username = models.CharField(max_length=20, default='')
    Password = models.CharField(max_length=32, default='')
    AreaCode = models.IntegerField()  # کد منطفه
    CityCode = models.IntegerField()  # کد شهر
    RepresentativeCode = models.IntegerField()  # کد نماینده
    ListOfVillages = ArrayField(models.IntegerField(default=0), size=30, default=list)  # لیستی از روستاها
    ListOfMGasEmployee = ArrayField(models.IntegerField(default=0), size=10, default=list)  # لیستی از معین گازبان
    Session = models.CharField(default=secrets.token_urlsafe(100), max_length=150)
    RegisterTime = jmodels.jDateTimeField(default=getDateTime)


class Representative(models.Model):  # نماینده
    PeCode = models.IntegerField(default=getRandomInt)
    Name = models.CharField(max_length=150)
    Family = models.CharField(max_length=150)
    NationalCode = models.CharField(max_length=15)
    ListOfPhone = ArrayField(models.CharField(max_length=12), size=10, default=list)
    Username = models.CharField(max_length=20, default='')
    Password = models.CharField(max_length=32, default='')
    AreaCode = models.IntegerField()
    AgreementNumber = models.IntegerField()  # شماره پیمان
    Session = models.CharField(default=secrets.token_urlsafe(100), max_length=150)
    RegisterTime = jmodels.jDateTimeField(default=getDateTime())


class Rescuer(models.Model):  # امدادگر
    PeCode = models.IntegerField(default=getRandomInt)
    Name = models.CharField(max_length=150, default='امدادگر')
    Username = models.CharField(max_length=20, default='')
    Password = models.CharField(max_length=32, default='')
    AreaCode = models.IntegerField()
    Session = models.CharField(default=secrets.token_urlsafe(100), max_length=150)
    RegisterTime = jmodels.jDateTimeField(default=getDateTime())


class HeadCity(models.Model):  # رئیس شهر
    PeCode = models.IntegerField(default=getRandomInt)
    Name = models.CharField(max_length=150)
    Family = models.CharField(max_length=150)
    NationalCode = models.CharField(max_length=15)
    ListOfPhone = ArrayField(models.CharField(max_length=12), size=10, default=list)
    Username = models.CharField(max_length=20, default='')
    Password = models.CharField(max_length=32, default='')
    CityCode = models.IntegerField()  # کد شهر
    AreaCode = models.IntegerField()
    Session = models.CharField(default=secrets.token_urlsafe(100), max_length=150)
    RegisterTime = jmodels.jDateTimeField(default=getDateTime())


class HeadRelief(models.Model):  # رئیس امداد
    PeCode = models.IntegerField(default=getRandomInt)
    Name = models.CharField(max_length=150)
    Family = models.CharField(max_length=150)
    NationalCode = models.CharField(max_length=15)
    ListOfPhone = ArrayField(models.CharField(max_length=12), size=10, default=list)
    Username = models.CharField(max_length=20, default='')
    Password = models.CharField(max_length=32, default='')
    ListOfCity = ArrayField(models.IntegerField(default=0), size=20, default=list)
    AreaCode = models.IntegerField()
    Session = models.CharField(default=secrets.token_urlsafe(100), max_length=150)
    RegisterTime = jmodels.jDateTimeField(default=getDateTime())


class HeadArea(models.Model):
    PeCode = models.IntegerField(default=getRandomInt)
    Name = models.CharField(max_length=150)
    Family = models.CharField(max_length=150)
    NationalCode = models.CharField(max_length=15)
    ListOfPhone = ArrayField(models.CharField(max_length=12), size=10, default=list)
    Username = models.CharField(max_length=20, default='')
    Password = models.CharField(max_length=32, default='')
    CityCode = models.IntegerField()  # کد شهر
    AreaCode = models.IntegerField()
    Session = models.CharField(default=secrets.token_urlsafe(100), max_length=150)
    RegisterTime = jmodels.jDateTimeField(default=getDateTime())


class DailyRequest(models.Model):
    status_choices = (
        ('WaitAccept', 'WaitAccept'),
        ('Accepted', 'Accepted'),
        ('RejectFConf', 'RejectFConf'),
        ('RejectSConf', 'RejectSConf'),
        ('RejectTConf', 'RejectTConf'),
    )
    Code = models.IntegerField(default=getRandomInt)
    PeCode = models.IntegerField()
    MCode = models.IntegerField()
    FConf = models.BooleanField(default=False)  # First Confirmation --> Moeen
    SConf = models.BooleanField(blank=True, null=True, default=None)  # Second Confirmation --> Representative
    TConf = models.BooleanField(blank=True, null=True, default=None)  # Third Confirmation --> HeadCity or HeadRelief
    ConfirmTime = jmodels.jDateTimeField(blank=True, null=True)
    RegisterTime = jmodels.jDateTimeField(default=getDateTime)
    Status = models.CharField(max_length=30, choices=status_choices, default='WaitAccept')


class HourlyRequest(models.Model):
    status_choices = (
        ('WaitAccept', 'WaitAccept'),
        ('Accepted', 'Accepted'),
        ('RejectFConf', 'RejectFConf'),
        ('RejectSConf', 'RejectSConf'),
    )
    Code = models.IntegerField(default=getRandomInt)
    PeCode = models.IntegerField()
    MCode = models.IntegerField()
    Duration = models.IntegerField(default=0)
    FConf = models.BooleanField(default=False)  # First Confirmation --> Moeen
    SConf = models.BooleanField(blank=True, null=True, default=None)  # Second Confirmation --> Representative
    Status = models.CharField(max_length=30, choices=status_choices, default='WaitAccept')
    StartTime = jmodels.jDateTimeField(blank=True, null=True)
    EndTime = jmodels.jDateTimeField(blank=True, null=True)
    RegisterTime = jmodels.jDateTimeField(default=getDateTime)

