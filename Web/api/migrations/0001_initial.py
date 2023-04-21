# Generated by Django 4.1.5 on 2023-04-16 11:10

import api.models
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='API_KEYS',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('API_KEY', models.CharField(max_length=110)),
                ('Hash', models.CharField(max_length=150)),
                ('PermissionAddAPI', models.BooleanField(default=False)),
                ('PermissionListApi', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='GasEmployee',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('PeCode', models.IntegerField(default=api.models.getRandomInt)),
                ('Name', models.CharField(max_length=150)),
                ('Family', models.CharField(max_length=150)),
                ('NationalCode', models.CharField(max_length=15)),
                ('ListOfPhone', models.JSONField()),
                ('AreaCode', models.IntegerField()),
                ('CityCode', models.IntegerField()),
                ('RepresentativeCode', models.IntegerField()),
                ('ListOfVillage', models.JSONField()),
                ('ListOfMGasEmployee', models.JSONField()),
                ('RegisterTime', models.DateTimeField(default='1402-01-27 15:40:59.20328')),
            ],
        ),
        migrations.CreateModel(
            name='HeadArea',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('PeCode', models.IntegerField(default=api.models.getRandomInt)),
                ('Name', models.CharField(max_length=150)),
                ('Family', models.CharField(max_length=150)),
                ('NationalCode', models.CharField(max_length=15)),
                ('Phone', models.CharField(max_length=15)),
                ('CityCode', models.IntegerField()),
                ('AreaCode', models.IntegerField()),
                ('RegisterTime', models.DateTimeField(default='1402-01-27 15:40:59.21334')),
            ],
        ),
        migrations.CreateModel(
            name='HeadCity',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('PeCode', models.IntegerField(default=api.models.getRandomInt)),
                ('Name', models.CharField(max_length=150)),
                ('Family', models.CharField(max_length=150)),
                ('NationalCode', models.CharField(max_length=15)),
                ('Phone', models.CharField(max_length=15)),
                ('CityCode', models.IntegerField()),
                ('AreaCode', models.IntegerField()),
                ('RegisterTime', models.DateTimeField(default='1402-01-27 15:40:59.21334')),
            ],
        ),
        migrations.CreateModel(
            name='HeadRelief',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('PeCode', models.IntegerField(default=api.models.getRandomInt)),
                ('Name', models.CharField(max_length=150)),
                ('Family', models.CharField(max_length=150)),
                ('NationalCode', models.CharField(max_length=15)),
                ('ListOfPhone', models.JSONField()),
                ('CityCode', models.IntegerField()),
                ('AreaCode', models.IntegerField()),
                ('RegisterTime', models.DateTimeField(default='1402-01-27 15:40:59.21334')),
            ],
        ),
        migrations.CreateModel(
            name='Representative',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('PeCode', models.IntegerField(default=api.models.getRandomInt)),
                ('Name', models.CharField(max_length=150)),
                ('Family', models.CharField(max_length=150)),
                ('NationalCode', models.CharField(max_length=15)),
                ('Phone', models.CharField(max_length=15)),
                ('AreaCode', models.IntegerField()),
                ('AgreementNumber', models.IntegerField()),
                ('RegisterTime', models.DateTimeField(default='1402-01-27 15:40:59.20328')),
            ],
        ),
        migrations.CreateModel(
            name='Rescuer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('PeCode', models.IntegerField(default=api.models.getRandomInt)),
                ('Name', models.CharField(default='امدادگر', max_length=150)),
                ('AreaCode', models.IntegerField()),
                ('RegisterTime', models.DateTimeField(default='1402-01-27 15:40:59.21334')),
            ],
        ),
    ]
