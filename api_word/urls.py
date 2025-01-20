from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import WordsViewSet,PageWordsViewSet,SentenceViewSet, PageSentenceViewSet

app_name = 'api_word'

router = DefaultRouter()
router.register(r'word', WordsViewSet, basename='word')
router.register(r'pageWord', PageWordsViewSet, basename='PageWord')
router.register(r'sentence', SentenceViewSet, basename='sentence')
router.register(r'pageSentence', PageSentenceViewSet, basename='PageSentence')

urlpatterns = [
    path('',include(router.urls))
]
