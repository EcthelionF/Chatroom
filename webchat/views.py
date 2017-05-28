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
        return HttpResponseRedirect(reverse('index'))


# 用户登出
class LogoutView(View):

    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse('index'))


# 联系人列表
class ContactView(View):

    def get(self, request):
        contacts = request.user.friends.select_related().values("id", "name", )
        groups = []
        for group in WebGroup.objects.all():                # 遍历所有群组，返回请求用户所在的群
            for member in group.members.select_related():
                if member.id == request.user.id:
                    groups.append({
                        "id": group.id,
                        "name": group.name,
                        "max_members": group.max_members,
                    })

        contact_dic = {         # 组关联了联系人、联系人没有关联组，所以要使用webgroup_set反向查询
            "group_list": groups,             # 群列表
            "contact_list": list(contacts),         # 联系人列表
        }
        return HttpResponse(json.dumps(contact_dic))


# 处理前台消息
class HandleMsgView(View):

    # 接收前台传来消息
    def post(self, request):
        global Global_MQ
        data = json.loads(request.POST.get("data"))
        send_to = data["send_to"]
        msg_from = data["from"]
        contact_type = data["contact_type"]

        # 处理群聊消息
        if contact_type == "group_contact":
            group_obj = WebGroup.objects.get(id=send_to)
            for group_member in group_obj.members.select_related():
                member_id = str(group_member.id)
                if member_id not in Global_MQ:              # 群成员的消息队列未创建，则创建一个
                    Global_MQ[member_id] = Queue.Queue()
                if member_id != msg_from:                   # 群消息不发送给自己
                    data["timestamp"] = time.time()         #    给接收到的消息打上时间戳后加入队列
                    Global_MQ[member_id].put(data)
        # 处理私聊消息
        else:
            if send_to not in Global_MQ:                    # 消息队列中没有该联系人，则新建一个
                Global_MQ[send_to] = Queue.Queue()

            data["timestamp"] = time.time()                 # 给接收到的消息打上时间戳后加入队列
            Global_MQ[send_to].put(data)                    # 在有用户发起get请求获取消息之前，暂存在服务端

        return HttpResponse("OK")

    # 发送消息到前台
    def get(self, request):
        global Global_MQ
        request_user = str(request.user.id)
        msg_list = []
        if request_user in Global_MQ:
            msg_nums = Global_MQ[request_user].qsize()
            if msg_nums == 0:       # 没有新消息则把队列阻塞，直到有新消息进入（前端GetMsg()递归请求新消息）
                try:
                    msg_list.append(Global_MQ[request_user].get(timeout=3))     # 3秒内有新消息即加入到消息队列中
                except Exception:       # 3秒后无论是否有新消息都返回
                    pass
            for _ in range(msg_nums):
                msg_list.append(Global_MQ[request_user].get())

        else:       # 当请求中的联系人的消息队列未建立
            Global_MQ[request_user] = Queue.Queue()

        return HttpResponse(json.dumps(msg_list))
