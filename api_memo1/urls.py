from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import Memo1ViewSet, PageMemo1ViewSet

app_name = 'api_memo1'

router = DefaultRouter()
router.register(r'memo1', Memo1ViewSet, basename='memo1')
router.register(r'pageMemo1', PageMemo1ViewSet, basename='PageMemo1')


urlpatterns = [
    path('',include(router.urls))
]
