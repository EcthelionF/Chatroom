from django.conf.urls import url
from django.contrib import admin
from webchat.views import IndexView, LoginView, LogoutView, ContactView, HandleMsgView
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^login/$', LoginView.as_view(), name='login'),
    url(r'^logout/$', LogoutView.as_view(), name='logout'),
    url(r'contacts/$', ContactView.as_view(), name='contacts'),
    url(r'handle_msg/$', HandleMsgView.as_view(), name='handle_msg'),
]
