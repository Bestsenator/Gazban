# Generated by Django 4.2.1 on 2023-05-20 12:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0008_dailyrequest_status_alter_gasemployee_session_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='gasemployee',
            name='ListOfMGasEmployee',
        ),
        migrations.RemoveField(
            model_name='gasemployee',
            name='ListOfPhone',
        ),
        migrations.RemoveField(
            model_name='gasemployee',
            name='ListOfVillage',
        ),
        migrations.AlterField(
            model_name='gasemployee',
            name='Session',
            field=models.CharField(default='7X-GtfbC5QatZlB5xRx-kOJ0iuFFy5ewbCdY08XEKPxR-_gADWOe4sh7oIrirXQ_HAAupsmIE9ZcinKYfmJZhD3t8RwkW29D3h6fRgCtgnnpDPQZGFxv01P4RkCZ2KGxAnpVxA', max_length=150),
        ),
        migrations.AlterField(
            model_name='headarea',
            name='RegisterTime',
            field=models.DateTimeField(default='2023-05-20 12:57:04.905187+00:00'),
        ),
        migrations.AlterField(
            model_name='headarea',
            name='Session',
            field=models.CharField(default='-gmNCHo7uNFehYrIvsGtXEy_fZklf-Ui2_fRO0PdtVyf4ZtUOqL6jRq11k_BVCbZEZO0SthEgOrhxwk0pg2vRjhLGtc_yOLS20SWK6cMIOYiAjTbKUfLZ-v7uEVYkcCL1McdWg', max_length=150),
        ),
        migrations.AlterField(
            model_name='headcity',
            name='RegisterTime',
            field=models.DateTimeField(default='2023-05-20 12:57:04.905187+00:00'),
        ),
        migrations.AlterField(
            model_name='headcity',
            name='Session',
            field=models.CharField(default='mRqc2wP5hziXCESxJoGnZ2vmOGnqowTgLqclNS07MlLi1QdokRzAPUmitbtR6SZaizsF9CjTfrwQdiBIISmv-ixC5SWMUSrPdQNwRaYsckn2lRxc1q6IFW8ukXTpT_R91nleIA', max_length=150),
        ),
        migrations.AlterField(
            model_name='headrelief',
            name='RegisterTime',
            field=models.DateTimeField(default='2023-05-20 12:57:04.905187+00:00'),
        ),
        migrations.AlterField(
            model_name='headrelief',
            name='Session',
            field=models.CharField(default='1f6GEP_kIwPEcz7WCdFCSlnXg2aAHcNka_vLgNW2nt9xWLlbWyftHHQvkd_sTohinhM2SVTUNOqttG2IzSpmCfCyzA1MjJMAbwUMCA2eA9v1qZQAajgFVTjTHL06hMuCFjmWxg', max_length=150),
        ),
        migrations.AlterField(
            model_name='representative',
            name='RegisterTime',
            field=models.DateTimeField(default='2023-05-20 12:57:04.904189+00:00'),
        ),
        migrations.AlterField(
            model_name='representative',
            name='Session',
            field=models.CharField(default='EiAWFCKbvVfUl9swOfVshI2ij_rtUpCN24iSSwMGZMXD1-JtVWVg6-ZDu1hH2vlllIjwP85RmyVoTw3OfnDB-DC50hq2nn-pP7G0cXHm54pgnMFwcwJnFnDAf1Kf4i17A2EyRQ', max_length=150),
        ),
        migrations.AlterField(
            model_name='rescuer',
            name='RegisterTime',
            field=models.DateTimeField(default='2023-05-20 12:57:04.905187+00:00'),
        ),
        migrations.AlterField(
            model_name='rescuer',
            name='Session',
            field=models.CharField(default='wujpmPcDSzlrOinMDQWxHtDHZCUmwjSZhLrFa-Hm1QWo_gWkVscLW4tzPhEH8Snt-4Z1Y-egjNmoRornEB-k_IRoA5JwHfeXIPawebcHQXmAOOdw0rC1n3meTrJor4MbnqPKnA', max_length=150),
        ),
    ]
