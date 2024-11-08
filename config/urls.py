from django.contrib import admin
from django.views.generic import TemplateView
from django.urls import path,include
from .views import HomeView

from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('wlist/', include('wlist.urls')),
    # path('',TemplateView.as_view(template_name='home.html'), name='home'),
    path('', HomeView.as_view(template_name='home.html'), name='home'),

    path('accounts/', include('accounts.urls')),
    path('accounts/', include('django.contrib.auth.urls')),

]

if settings.DEBUG:  # 開発環境のみメディアファイル提供を許可
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
