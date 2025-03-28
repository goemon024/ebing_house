from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import Memo2ViewSet,PageMemo2ViewSet

app_name = 'api_memo2'

router = DefaultRouter()
router.register(r'memo2', Memo2ViewSet, basename='memo2')
router.register(r'pageMemo2', PageMemo2ViewSet, basename='PageMemo2')

urlpatterns = [
    path('',include(router.urls))
]
