from django.contrib import admin
from django.views.generic import TemplateView
from django.urls import path,include
from .views import HomeView

# from rest_framework.authtoken import views
from .views import CustomAuthToken

from django.conf.urls.static import static
from django.conf import settings

from django.contrib.auth.views import LogoutView

from .views import logout_view  # config/views.py にある logout_view をインポート


urlpatterns = [
    path('admin/', admin.site.urls),
    path('wlist/', include('wlist.urls')),
    # path('',TemplateView.as_view(template_name='home.html'), name='home'),
    path('', HomeView.as_view(template_name='home.html'), name='home'),

    path('accounts/', include('accounts.urls')),
    path('accounts/', include('django.contrib.auth.urls')),
    
    # path('authen/', views.obtain_auth_token),  # rest_frameworkの標準
    path('authen/', CustomAuthToken.as_view()), 
    path('api_user/',include('api_user.urls')),
    path('api_word/',include('api_word.urls')),
    path('api_memo1/',include('api_memo1.urls')),
    path('api_memo2/',include('api_memo2.urls')),
    
    path('logout/', LogoutView.as_view(next_page='/login/'), name='logout'),
    path('api/logout/', logout_view, name='logout'),  # logout_view をルートに追加

]

if settings.DEBUG:  # 開発環境のみメディアファイル提供を許可
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
