# -*- coding: utf-8 -*-

from django.db import models

from django.contrib.auth.models import User


class UserProfile(models.Model):
    user = models.OneToOneField(User)
    name = models.CharField(max_length=64, blank=True, null=True)
    signature = models.CharField(max_length=255, blank=True, null=True)
    head_img = models.ImageField(height_field=150, width_field=150, blank=True, null=True)
    friends = models.ManyToManyField("self", related_name="my_friends", blank=True)

    def __str__(self):
        return self.name


class WebGroup(models.Model):
    name = models.CharField(max_length=64)
    brief = models.CharField(max_length=255, blank=True, null=True)
    owner = models.ForeignKey(UserProfile)
    admins = models.ManyToManyField(UserProfile, blank=True, related_name="group_admin")
    members = models.ManyToManyField(UserProfile, blank=True, related_name="group_member")
    max_members = models.IntegerField(default=200)

    def __str__(self):
        return self.name
