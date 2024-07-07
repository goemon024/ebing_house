from django.shortcuts import render
from django.views.generic import ListView, CreateView, DeleteView, UpdateView
from .models import WordsModel
from django.urls import reverse_lazy

# Create your views here.

class WordsList(ListView):
    template_name = 'wlist.html'
    model = WordsModel

# class TodoDetail(DetailView):
#     template_name = 'detail.html'
#     model = WordsModel

class WordsCreate(CreateView):
    template_name = 'create.html'
    model = WordsModel
    fields = ('word',)
    success_url = reverse_lazy('wlist')  # reverse_lazyは、データが保存された後に実行される。
    
    
    
    
class WordsDelete(DeleteView):
    template_name = 'delete.html'
    model = WordsModel
    success_url = reverse_lazy('wlist')
    
class WordsUpdate(UpdateView):
    template_name = 'update.html'
    model = WordsModel
    fields = ('word','mean1','mean2','reg_date')
    success_url = reverse_lazy('wlist')
