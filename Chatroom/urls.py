# -*- coding: utf-8 -*-

from django.conf.urls import url
from django.contrib import admin
from django.views.static import serve       # 处理静态文件

from Chatroom.settings import MEDIA_ROOT

from webchat.views import IndexView, LoginView, LogoutView, ContactView, HandleMsgView
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', IndexView.as_view(), name='index'),

    # 上传媒体文件的访问处理
    url(r'^media/(?P<path>.*)$', serve, {'document_root': MEDIA_ROOT}),

    url(r'^login/$', LoginView.as_view(), name='login'),
    url(r'^logout/$', LogoutView.as_view(), name='logout'),
    url(r'contacts/$', ContactView.as_view(), name='contacts'),
    url(r'handle_msg/$', HandleMsgView.as_view(), name='handle_msg'),
]
