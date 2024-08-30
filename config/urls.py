from django.contrib import admin
from django.views.generic import TemplateView
from django.urls import path,include
from .views import CustomTemplateView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('wlist/', include('wlist.urls')),
    # path('',TemplateView.as_view(template_name='home.html'), name='home'),
    path('', CustomTemplateView.as_view(template_name='home.html'), name='home'),

    path('accounts/', include('accounts.urls')),
    path('accounts/', include('django.contrib.auth.urls')),


]
