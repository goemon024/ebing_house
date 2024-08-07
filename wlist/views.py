from django.shortcuts import render
from django.views.generic import ListView, CreateView, DeleteView, UpdateView, TemplateView
from .models import WordsModel, MemoModel
from .forms import MemoForm, DateRangeForm
from django.urls import reverse_lazy

from django.contrib.auth.mixins import LoginRequiredMixin
# from django.views.generic.edit import FormMixin

from django.core.mail import send_mail
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required

from django.utils import timezone
from datetime import timedelta
from datetime import date
import random

import logging
logger = logging.getLogger(__name__)

# Create your views here.

class CustomHomeView(LoginRequiredMixin, TemplateView):
    template_name = 'home.html'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['today_date'] = timezone.now().date()
        return context

class Tutorial(LoginRequiredMixin,TemplateView):
    template_name= 'tutorial.html'


class WordMemoList(LoginRequiredMixin,ListView):
    ## ListViewにより、テンプレート上のobject_listでモデルのインスタンスが渡される。
    template_name = 'list_top.html'
    model = WordsModel
    
    def get_queryset(self):
        return WordsModel.objects.filter(user=self.request.user).order_by('-reg_date','-id')

    def get_context_data(self, **kwargs):
        context = super(ListView,self).get_context_data(**kwargs)
        context['memo_list'] = MemoModel.objects.filter(user=self.request.user).order_by('-reg_date','-id')
        return context

class WordsList(LoginRequiredMixin,ListView):
    template_name = 'list_word.html'
    model = WordsModel
    
    def get_queryset(self):
        return WordsModel.objects.filter(user=self.request.user).order_by('-reg_date','-id')
    
class MemoList(LoginRequiredMixin,ListView):
    template_name = 'list_memo.html'
    model = MemoModel
    
    def get_queryset(self):
        return MemoModel.objects.filter(user=self.request.user).order_by('-reg_date','-id')


# class TodoDetail(DetailView):
#     template_name = 'detail.html'
#     model = WordsModel

class WordsCreate(LoginRequiredMixin,CreateView):
    template_name = 'word_create.html'
    model = WordsModel
    fields = ('word',)
    success_url = reverse_lazy('wlist:list_word')  # reverse_lazyは、データが保存された後に実行される。
    
    def form_valid(self, form):
        form.instance.user = self.request.user
        return super().form_valid(form)
    
    
class WordsDelete(LoginRequiredMixin,DeleteView):
    template_name = 'word_delete.html'
    model = WordsModel
    success_url = reverse_lazy('wlist:list_word')
    
class WordsUpdate(LoginRequiredMixin,UpdateView):
    template_name = 'word_update.html'
    model = WordsModel
    fields = ('user','word','mean1','mean2','reg_date')
    success_url = reverse_lazy('wlist:list_word')

    # def form_valid(self, form):
    #     instance = form.save(commit=False)
    #     if not instance.reg_date:
    #         instance.reg_date = self.object.reg_date
    #     return super().form_valid(form)

##################################

class MemoCreate(LoginRequiredMixin,CreateView):
    template_name = 'memo_create.html' 
    model = MemoModel
    form_class = MemoForm
    # fields = ('memo',)
    success_url = reverse_lazy('wlist:list_memo')  # reverse_lazyは、データが保存された後に実行される。
    
    def form_valid(self, form):
        form.instance.user = self.request.user
        return super().form_valid(form)
    
    
class MemoDelete(LoginRequiredMixin,DeleteView):
    template_name = 'memo_delete.html' ## wordと同じHTMLファイル
    model = MemoModel
    success_url = reverse_lazy('wlist:list_memo')
    
class MemoUpdate(LoginRequiredMixin,UpdateView):
    template_name = 'memo_update.html'
    model = MemoModel
    fields = ('user','memo','reg_date')
    success_url = reverse_lazy('wlist:list_memo')

#######################################################
class WordsRecord(LoginRequiredMixin, CreateView, ListView):
    template_name = 'word_record.html'
    model = WordsModel
    fields = ('word',)
    success_url = reverse_lazy('wlist:word_record')  # reverse_lazyは、データが保存された後に実行される。
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        today = timezone.localtime(timezone.now())        
        context['today_records'] = WordsModel.objects.filter(
            user=self.request.user,
            reg_date=today.date()
        )
        context['form'] = self.get_form()
        return context
    
    def form_valid(self, form):
        form.instance.user = self.request.user
        return super().form_valid(form)


class MemoRecord(LoginRequiredMixin, CreateView, ListView):
    template_name = 'memo_record.html'
    model = MemoModel
    fields = ('memo',)
    success_url = reverse_lazy('wlist:memo_record')  # reverse_lazyは、データが保存された後に実行される。
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        today = timezone.localtime(timezone.now())
        context['today_records'] = MemoModel.objects.filter(
            user=self.request.user,
            reg_date=today.date()
        )
        context['form'] = self.get_form()
        return context
    
    def form_valid(self, form):
        form.instance.user = self.request.user
        return super().form_valid(form)

#######################################################
class WordsReview(LoginRequiredMixin, ListView):
    template_name = 'word_review.html'
    model = WordsModel
    fields = ('word',)
    success_url = reverse_lazy('wlist:word_review')  # reverse_lazyは、データが保存された後に実行される。
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        today = timezone.localtime(timezone.now())        
        context['today_records'] = WordsModel.objects.filter(
            user=self.request.user,
            reg_date=today.date()
        )
        
        passed_list = list(WordsModel.objects.filter(
            user=self.request.user,
            reg_date=today.date()- timedelta(days=1)))\
                    + list(WordsModel.objects.filter(
            user=self.request.user,
            reg_date=today.date()- timedelta(days=7)))\
                    + list(WordsModel.objects.filter(
            user=self.request.user,
            reg_date=today.date()- timedelta(days=28)))
        
        random.shuffle(passed_list)
        context['passed_records'] = passed_list

        return context

class MemoReview(LoginRequiredMixin, ListView):
    template_name = 'memo_review.html'
    model = MemoModel
    fields = ('memo',)
    success_url = reverse_lazy('wlist:memo_review')  # reverse_lazyは、データが保存された後に実行される。
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        today = timezone.localtime(timezone.now())        
        context['today_records'] = MemoModel.objects.filter(
            user=self.request.user,
            reg_date=today.date()
        )
        
        passed_list = list(MemoModel.objects.filter(
            user=self.request.user,
            reg_date=today.date()- timedelta(days=1)))\
                    + list(MemoModel.objects.filter(
            user=self.request.user,
            reg_date=today.date()- timedelta(days=7)))\
                    + list(MemoModel.objects.filter(
            user=self.request.user,
            reg_date=today.date()- timedelta(days=28)))
        
        random.shuffle(passed_list)
        context['passed_records'] = passed_list

        return context

#######################################################
class WordsDrill(LoginRequiredMixin, ListView):
    
    template_name = 'word_drill.html'
    model = WordsModel
    fields = ('word',)
    context_object_name = 'drill_records'
    success_url = reverse_lazy('wlist:word_drill')  # reverse_lazyは、データが保存された後に実行される。
        
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        form = DateRangeForm(self.request.GET or None)  # GETリクエストからフォームデータを取得

        if form.is_valid():
            start_date = form.cleaned_data['start_date']
            end_date = form.cleaned_data['end_date']
            drill_list = list(self.model.objects.filter(user=self.request.user,
                                             reg_date__range=(start_date, end_date)))
            random.shuffle(drill_list)
            context['drill_records'] = drill_list

        return context


class MemoDrill(LoginRequiredMixin, ListView):
    
    template_name = 'memo_drill.html'
    model = MemoModel
    fields = ('memo',)
    context_object_name = 'drill_records'
    success_url = reverse_lazy('wlist:memo_drill')  # reverse_lazyは、データが保存された後に実行される。
        
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        form = DateRangeForm(self.request.GET or None)  # GETリクエストからフォームデータを取得

        if form.is_valid():
            start_date = form.cleaned_data['start_date']
            end_date = form.cleaned_data['end_date']
            drill_list = list(self.model.objects.filter(user=self.request.user,
                                             reg_date__range=(start_date, end_date)))
            random.shuffle(drill_list)
            context['drill_records'] = drill_list

        return context




@login_required
def send_email_view(request):
    # example_instance = get_object_or_404(WordsModel, user=request.user)
    user_words =  WordsModel.objects.filter(user=request.user)
    subject = 'Your Data from ExampleModel'
    
    message = f'Hello {request.user.username}\n'
    for w in user_words:
        message += f'{w.word}:{w.mean1},{w.mean2}\n' 
    
    from_email = 'hirotrics@gmail.com'
    recipient_list = [request.user.email]
    
    logger.info(f"------Recipient email------: {request.user.email}")

    send_mail(subject, message, from_email, recipient_list)
    
    return render(request, 'email_sent.html')