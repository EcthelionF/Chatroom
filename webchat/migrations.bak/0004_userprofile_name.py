# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2017-05-26 04:48
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('webchat', '0003_remove_userprofile_name'),
    ]

    operations = [
        migrations.AddField(
            model_name='userprofile',
            name='name',
            field=models.CharField(blank=True, max_length=64, null=True),
        ),
    ]
