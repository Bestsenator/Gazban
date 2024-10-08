# Generated by Django 4.1.5 on 2023-04-16 12:28

import api.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_gasemployee_session_headarea_session_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='gasemployee',
            name='Password',
            field=models.CharField(default='', max_length=32),
        ),
        migrations.AddField(
            model_name='gasemployee',
            name='Username',
            field=models.CharField(default='', max_length=20),
        ),
        migrations.AddField(
            model_name='headarea',
            name='Password',
            field=models.CharField(default='', max_length=32),
        ),
        migrations.AddField(
            model_name='headarea',
            name='Username',
            field=models.CharField(default='', max_length=20),
        ),
        migrations.AddField(
            model_name='headcity',
            name='Password',
            field=models.CharField(default='', max_length=32),
        ),
        migrations.AddField(
            model_name='headcity',
            name='Username',
            field=models.CharField(default='', max_length=20),
        ),
        migrations.AddField(
            model_name='headrelief',
            name='Password',
            field=models.CharField(default='', max_length=32),
        ),
        migrations.AddField(
            model_name='headrelief',
            name='Username',
            field=models.CharField(default='', max_length=20),
        ),
        migrations.AddField(
            model_name='representative',
            name='Password',
            field=models.CharField(default='', max_length=32),
        ),
        migrations.AddField(
            model_name='representative',
            name='Username',
            field=models.CharField(default='', max_length=20),
        ),
        migrations.AddField(
            model_name='rescuer',
            name='Password',
            field=models.CharField(default='', max_length=32),
        ),
        migrations.AddField(
            model_name='rescuer',
            name='Username',
            field=models.CharField(default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='api_keys',
            name='API_KEY',
            field=models.CharField(default=api.models.getToken, max_length=110),
        ),
        migrations.AlterField(
            model_name='gasemployee',
            name='RegisterTime',
            field=models.DateTimeField(default='1402-01-27 16:58:45.674429'),
        ),
        migrations.AlterField(
            model_name='gasemployee',
            name='Session',
            field=models.CharField(default='tZo3tarxGVq9iMwyDSfk6xcPbNuWkmg6Fe4dqnKjNRenQMCwruZcFXs4ZEgE5R3BuLfLMQHYZK-G0XI1PBDyMkViAzQrbqUMOD5XYBgE77Y3tRw_EpVGv2fMltLp3aW7Ia0JKg', max_length=150),
        ),
        migrations.AlterField(
            model_name='headarea',
            name='RegisterTime',
            field=models.DateTimeField(default='1402-01-27 16:58:45.676432'),
        ),
        migrations.AlterField(
            model_name='headarea',
            name='Session',
            field=models.CharField(default='G8HrirYs62ylev55AqDU7Y7mhICgrz2-UPWQsH2OZvAxVrDcuk-9VStU5CqO8cHZx2-AxzqhSscFHWkiXSBwPd9o7XE5wXh4MQvJDFM1COnG41keG43gRPovo0sCGbzIBjkpuw', max_length=150),
        ),
        migrations.AlterField(
            model_name='headcity',
            name='RegisterTime',
            field=models.DateTimeField(default='1402-01-27 16:58:45.675435'),
        ),
        migrations.AlterField(
            model_name='headcity',
            name='Session',
            field=models.CharField(default='_xUd1u04taTBo2cCKcb6IpxlobKeydcGblhjgASM8JoW4OvQ9dATqIaGcDIeN7wby_skoMkFxZ26hsJHrj7EYK0B-YsiBj_0TkeoXfTWtudsh0mxcV7hbT4KjeML59wjY9yB2w', max_length=150),
        ),
        migrations.AlterField(
            model_name='headrelief',
            name='RegisterTime',
            field=models.DateTimeField(default='1402-01-27 16:58:45.675435'),
        ),
        migrations.AlterField(
            model_name='headrelief',
            name='Session',
            field=models.CharField(default='3EsRashg2fCOWqkOKjItEz_017PM8EVzpeBsLwescEulMIh06E7esDpQHASVwyiDZBDrRulJzN3Mo5E2OP_fMpnr8ryyFUVjk4_HRo78JU46-wN0PK3bxrUEB431OCmLoGQURw', max_length=150),
        ),
        migrations.AlterField(
            model_name='representative',
            name='RegisterTime',
            field=models.DateTimeField(default='1402-01-27 16:58:45.674429'),
        ),
        migrations.AlterField(
            model_name='representative',
            name='Session',
            field=models.CharField(default='-99tgIAuG17UHIfkmDExurOPcj4XHUPqAwSwuSUmU1TGWRlUt2gMim6dMM5kapMjxRpZzZUUavskfAwt4s3Gs1tqaE9fY3EKNzqEdjfKE3KcayI9GmGDjb1HWwfcC_5thhyDFw', max_length=150),
        ),
        migrations.AlterField(
            model_name='rescuer',
            name='RegisterTime',
            field=models.DateTimeField(default='1402-01-27 16:58:45.675435'),
        ),
        migrations.AlterField(
            model_name='rescuer',
            name='Session',
            field=models.CharField(default='K5s401PGvmyhenJrYD75-MgwQZHWtb7B-T2Fokj_FiJQhCBwy4AqG4yo77scU1EWd-yrsI4b5wQ40DioBKTkLs7EWTaMSdlEq4TegxF3KzH9w8UyLuO1G1epGmf5wQoMF8n_Hg', max_length=150),
        ),
    ]
