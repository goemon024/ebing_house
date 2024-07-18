from django.shortcuts import render
from django.views.generic import ListView, CreateView, DeleteView, UpdateView
from .models import WordsModel
from django.urls import reverse_lazy

from django.contrib.auth.mixins import LoginRequiredMixin

from django.core.mail import send_mail
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required

import logging
logger = logging.getLogger(__name__)

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
    
    def form_valid(self, form):
        form.instance.user = self.request.user
        return super().form_valid(form)
    
    
class WordsDelete(LoginRequiredMixin,DeleteView):
    template_name = 'delete.html'
    model = WordsModel
    success_url = reverse_lazy('wlist:list_top')
    
class WordsUpdate(LoginRequiredMixin,UpdateView):
    template_name = 'update.html'
    model = WordsModel
    fields = ('user','word','mean1','mean2','reg_date')
    success_url = reverse_lazy('wlist:list_top')


@login_required
def send_email_view(request):
    # example_instance = get_object_or_404(WordsModel, user=request.user)
    user_words =  WordsModel.objects.filter(user=request.user)
    subject = 'Your Data from ExampleModel'
    
    message = f'Hello {request.user.username}\n'
    for w in user_words:
        message += f'{w.word}:{w.mean1},{w.mean2}\n' 
    
    # message = f'Hello {request.user.username},\n{example_instance.word},\n{example_instance.mean1}'
    from_email = 'hirotrics@gmail.com'
    recipient_list = [request.user.email]
    
    logger.info(f"------Recipient email------: {request.user.email}")

    send_mail(subject, message, from_email, recipient_list)
    
    return render(request, 'email_sent.html')