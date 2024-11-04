from django.contrib import admin
from django.views.generic import TemplateView
from django.urls import path,include
from .views import HomeView
from rest_framework.authtoken import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('wlist/', include('wlist.urls')),
    # path('',TemplateView.as_view(template_name='home.html'), name='home'),
    path('', HomeView.as_view(template_name='home.html'), name='home'),

    path('accounts/', include('accounts.urls')),
    path('accounts/', include('django.contrib.auth.urls')),
    
    path('authen/', views.obtain_auth_token),  # rest_frameworkの標準
    path('api/user/',include('api_user.urls')),
    path('api/word/',include('api_word.urls')),
    path('api/memo1/',include('api_memo1.urls')),
    path('api/memo2/',include('api_memo2.urls')),

]
