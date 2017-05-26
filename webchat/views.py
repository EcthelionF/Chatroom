# -*- coding: utf-8 -*-

import json
import Queue
import time

from django.shortcuts import render
from django.views.generic.base import View
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse

from webchat.models import WebGroup, UserProfile
from webchat.forms import LoginForm

Global_MQ = {}


class IndexView(View):
    def get(self, request):
        return render(request, 'index.html', {})


# 用户登录
class LoginView(View):

    def post(self, request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            username = request.POST.get('username', '')
            password = request.POST.get('password', '')
            user = authenticate(username=username, password=password)
            if user is not None and user.is_active:
                login(request, user)
        return render(request, "index.html", {})


# 用户登出
class LogoutView(View):

    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse('index'))


# 联系人列表
class ContactView(View):

    def get(self, request):
        contacts = request.user.userprofile.friends.select_related().values("id", "name", )
        groups = request.user.userprofile.webgroup_set.select_related().values("id", "name", "max_members")
        contact_dic = {
            "group_list": list(groups),
            "contact_list": list(contacts),
        }
        return HttpResponse(json.dumps(contact_dic))


# 处理前台消息
class HandleMsgView(View):

    # 接收前台传来消息
    def post(self, request):
        data = json.loads(request.POST.get("data"))
        send_to = data["to"]

        if send_to not in Global_MQ:                        # 消息队列中没有该联系人，则新建一个
            Global_MQ[send_to] = Queue.Queue()
        data["timestamp"] = time.time()                     # 给接收到的消息打上时间戳后加入队列
        Global_MQ[send_to].put(data)

        return HttpResponse(Global_MQ[send_to].qsize())

    # 发送消息到前台
    def get(self, request):
        request_user = str(request.user.userprofile.id)
        msg_list = []
        if request_user in Global_MQ:
            msg_nums = Global_MQ[request_user].qsize()
            if msg_nums == 0:                               # 没有新消息则把队列阻塞，直到有新消息进入
                try:
                    msg_list.append(Global_MQ[request_user].get(timeout=3))
                except Exception:
                    pass
            for _ in range(msg_nums):
                msg_list.append(Global_MQ[request_user].get())

        # 没有用户发来消息时，新建一个队列
        else:
            Global_MQ[request_user] = Queue.Queue()

        return HttpResponse(json.dumps(msg_list))



