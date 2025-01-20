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
from firebase_admin import storage
from datetime import datetime
import os

class WordsPagination(PageNumberPagination):
    page_size = 20

class SentencePagination(PageNumberPagination):
    page_size = 10


class WordsViewSet(viewsets.ModelViewSet):
    queryset = WordsModel.objects.all()
    serializer_class = WordsSerializer
    
    authentication_classes = (authentication.TokenAuthentication,)
    permission_classes = (permissions.IsAuthenticated,)

    def _upload_to_firebase(self, image_file):
        try:
            bucket = storage.bucket()
            file_name = f"words/{self.request.user.id}/{datetime.now().timestamp()}_{image_file.name}"
            blob = bucket.blob(file_name)
            
            blob.upload_from_string(
                image_file.read(),
                content_type=image_file.content_type
            )
            
            return blob.public_url
        except Exception as e:
            print(f"Firebase upload error: {str(e)}")
            raise

    def perform_create(self, serializer):
        if 'image' in self.request.FILES:
            image = self.request.FILES['image']
            image_url = self._upload_to_firebase(image)
            serializer.save(user=self.request.user, image_url=image_url)
        else:
            serializer.save(user=self.request.user)

    def get_queryset(self):
        return self.queryset.filter(user=self.request.user)

    
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
        return self.queryset.filter(user=self.request.user, eval="OK")      ##追加