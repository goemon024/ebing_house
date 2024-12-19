from django.shortcuts import render
from rest_framework import generics, authentication, permissions

from .serializers import Memo2Serializer
from wlist.models import McModel
from django.db.models import Q
from rest_framework import viewsets
from rest_framework.exceptions import ValidationError
from rest_framework import status
from rest_framework.response import Response

from rest_framework.pagination import PageNumberPagination

class Memo2Pagination(PageNumberPagination):
    page_size = 20

# Create your views here.

class Memo2ViewSet(viewsets.ModelViewSet):
    queryset = McModel.objects.all()
    serializer_class = Memo2Serializer
    
    authentication_classes = (authentication.TokenAuthentication,)  ##追加
    permission_classes = (permissions.IsAuthenticated,)             ##追加

    def get_queryset(self):
        return self.queryset.filter(user=self.request.user)      ##追加


class PageMemo2ViewSet(viewsets.ModelViewSet):
    queryset = McModel.objects.all()
    serializer_class = Memo2Serializer
    pagination_class = Memo2Pagination
        
    authentication_classes = (authentication.TokenAuthentication,)  ##追加
    permission_classes = (permissions.IsAuthenticated,)             ##追加

    def get_queryset(self):
        return self.queryset.filter(user=self.request.user).order_by('-reg_date')      ##追加