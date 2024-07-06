from django.contrib import admin
from django.views.generic import TemplateView
from django.urls import path,include

urlpatterns = [
    path('admin/', admin.site.urls),
    # path('word/', include('todo.urls')),
    path('',TemplateView.as_view(template_name='home.html'), name='home'),
    path('accounts/', include('accounts.urls')),
    path('accounts/', include('django.contrib.auth.urls')),
]
