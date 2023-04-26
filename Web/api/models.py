import random
import secrets

import jdatetime
from django.db import models

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
    ListOfPhone = models.JSONField()
    Username = models.CharField(max_length=20, default='')
    Password = models.CharField(max_length=32, default='')
    AreaCode = models.IntegerField()  # کد منطفه
    CityCode = models.IntegerField()  # کد شهر
    RepresentativeCode = models.IntegerField()  # کد نماینده
    ListOfVillage = models.JSONField()  # لیستی از روستاها
    ListOfMGasEmployee = models.JSONField()  # لیستی از معین گازبان
    Session = models.CharField(default=secrets.token_urlsafe(100), max_length=150)
    RegisterTime = models.DateTimeField(default=getDateTime)


class Representative(models.Model):  # نماینده
    PeCode = models.IntegerField(default=getRandomInt)
    Name = models.CharField(max_length=150)
    Family = models.CharField(max_length=150)
    NationalCode = models.CharField(max_length=15)
    Phone = models.CharField(max_length=15)
    Username = models.CharField(max_length=20, default='')
    Password = models.CharField(max_length=32, default='')
    AreaCode = models.IntegerField()
    AgreementNumber = models.IntegerField()  # شماره پیمان
    Session = models.CharField(default=secrets.token_urlsafe(100), max_length=150)
    RegisterTime = models.DateTimeField(default=getDateTime())


class Rescuer(models.Model):  # امدادگر
    PeCode = models.IntegerField(default=getRandomInt)
    Name = models.CharField(max_length=150, default='امدادگر')
    Username = models.CharField(max_length=20, default='')
    Password = models.CharField(max_length=32, default='')
    AreaCode = models.IntegerField()
    Session = models.CharField(default=secrets.token_urlsafe(100), max_length=150)
    RegisterTime = models.DateTimeField(default=getDateTime())


class HeadCity(models.Model):  # رئیس شهر
    PeCode = models.IntegerField(default=getRandomInt)
    Name = models.CharField(max_length=150)
    Family = models.CharField(max_length=150)
    NationalCode = models.CharField(max_length=15)
    Phone = models.CharField(max_length=15)
    Username = models.CharField(max_length=20, default='')
    Password = models.CharField(max_length=32, default='')
    CityCode = models.IntegerField()  # کد شهر
    AreaCode = models.IntegerField()
    Session = models.CharField(default=secrets.token_urlsafe(100), max_length=150)
    RegisterTime = models.DateTimeField(default=getDateTime())


class HeadRelief(models.Model):  # رئیس امداد
    PeCode = models.IntegerField(default=getRandomInt)
    Name = models.CharField(max_length=150)
    Family = models.CharField(max_length=150)
    NationalCode = models.CharField(max_length=15)
    ListOfPhone = models.JSONField()
    Username = models.CharField(max_length=20, default='')
    Password = models.CharField(max_length=32, default='')
    CityCode = models.IntegerField()  # کد شهر
    AreaCode = models.IntegerField()
    Session = models.CharField(default=secrets.token_urlsafe(100), max_length=150)
    RegisterTime = models.DateTimeField(default=getDateTime())


class HeadArea(models.Model):
    PeCode = models.IntegerField(default=getRandomInt)
    Name = models.CharField(max_length=150)
    Family = models.CharField(max_length=150)
    NationalCode = models.CharField(max_length=15)
    Phone = models.CharField(max_length=15)
    Username = models.CharField(max_length=20, default='')
    Password = models.CharField(max_length=32, default='')
    CityCode = models.IntegerField()  # کد شهر
    AreaCode = models.IntegerField()
    Session = models.CharField(default=secrets.token_urlsafe(100), max_length=150)
    RegisterTime = models.DateTimeField(default=getDateTime())


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
    ConfirmTime = models.DateTimeField(blank=True, null=True)
    RegisterTime = models.DateTimeField(default=getDateTime)
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
    StartTime = models.DateTimeField(blank=True, null=True)
    EndTime = models.DateTimeField(blank=True, null=True)
    RegisterTime = models.DateTimeField(default=getDateTime)

