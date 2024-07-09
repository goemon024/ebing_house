from django.shortcuts import render
from django.views.generic import ListView, CreateView, DeleteView, UpdateView
from .models import WordsModel
from django.urls import reverse_lazy

from django.contrib.auth.mixins import LoginRequiredMixin

# Create your views here.

class WordsList(LoginRequiredMixin,ListView):
    template_name = 'list_top.html'
    model = WordsModel

# class TodoDetail(DetailView):
#     template_name = 'detail.html'
#     model = WordsModel

class WordsCreate(LoginRequiredMixin,CreateView):
    template_name = 'create.html'
    model = WordsModel
    fields = ('word',)
    success_url = reverse_lazy('wlist:list_top')  # reverse_lazyは、データが保存された後に実行される。
    
    
    
    
class WordsDelete(LoginRequiredMixin,DeleteView):
    template_name = 'delete.html'
    model = WordsModel
    success_url = reverse_lazy('wlist:list_top')
    
class WordsUpdate(LoginRequiredMixin,UpdateView):
    template_name = 'update.html'
    model = WordsModel
    fields = ('user','word','mean1','mean2','reg_date')
    success_url = reverse_lazy('wlist:list_top')
