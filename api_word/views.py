from django.shortcuts import render
from rest_framework import generics, authentication, permissions

from .serializers import WordsSerializer,SentenceSerializer
from wlist.models import WordsModel,ListSentenceModel
from django.db.models import Q
from rest_framework import viewsets
from rest_framework.exceptions import ValidationError
from rest_framework import status
from rest_framework.response import Response

from rest_framework.pagination import PageNumberPagination

class WordsPagination(PageNumberPagination):
    page_size = 20

class SentencePagination(PageNumberPagination):
    page_size = 10


class WordsViewSet(viewsets.ModelViewSet):
    queryset = WordsModel.objects.all()
    serializer_class = WordsSerializer
    
    authentication_classes = (authentication.TokenAuthentication,)  ##追加
    permission_classes = (permissions.IsAuthenticated,)             ##追加

    def get_queryset(self):
        return self.queryset.filter(user=self.request.user)      ##追加

    
class PageWordsViewSet(viewsets.ModelViewSet):
    queryset = WordsModel.objects.all()
    serializer_class = WordsSerializer
    pagination_class= WordsPagination
        
    authentication_classes = (authentication.TokenAuthentication,)  ##追加
    permission_classes = (permissions.IsAuthenticated,)             ##追加

    def get_queryset(self):
        return self.queryset.filter(user=self.request.user).order_by('-reg_date')      ##追加
    
    
class SentenceViewSet(viewsets.ModelViewSet):
    queryset = ListSentenceModel.objects.all()
    serializer_class = SentenceSerializer
    
    authentication_classes = (authentication.TokenAuthentication,)  ##追加
    permission_classes = (permissions.IsAuthenticated,)             ##追加

    def get_queryset(self):
        return self.queryset.filter(user=self.request.user)      ##追加
    
    
class PageSentenceViewSet(viewsets.ModelViewSet):
    queryset = ListSentenceModel.objects.all()
    serializer_class = SentenceSerializer
    pagination_class= SentencePagination
     
    authentication_classes = (authentication.TokenAuthentication,)  ##追加
    permission_classes = (permissions.IsAuthenticated,)             ##追加

    def get_queryset(self):
        return self.queryset.filter(user=self.request.user, eval='OK')      ##追加