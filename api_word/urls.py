from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import WordsViewSet,PageWordsViewSet

app_name = 'api_word'

router = DefaultRouter()
router.register(r'word', WordsViewSet, basename='word')
router.register(r'pageWord', PageWordsViewSet, basename='PageWord')


urlpatterns = [
    path('',include(router.urls))
]
