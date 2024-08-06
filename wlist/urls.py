from django.contrib import admin
from django.urls import path,include
from .views import WordsList, MemoList, WordMemoList, WordsCreate,\
WordsDelete, WordsUpdate, MemoCreate, MemoDelete, MemoUpdate,\
WordsRecord, MemoRecord, WordsReview, MemoReview,\
WordsDrill, MemoDrill, send_email_view

app_name = 'wlist'

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('list_top/', WordMemoList.as_view(), name='list_top'),
    # path('detail/<int:pk>', TodoDetail.as_view(), name='detail'),
    
    path('word_create/', WordsCreate.as_view(), name='create'),
    path('word_delete/<int:pk>', WordsDelete.as_view(), name='word_delete'),
    path('word_update/<int:pk>', WordsUpdate.as_view(), name='word_update'),
    
    path('word_record/', WordsRecord.as_view(), name='word_record'),
    path('word_review/', WordsReview.as_view(), name='word_review'),
    
    path('word_drill/', WordsDrill.as_view(), name='word_drill'),
    path('memo_drill/', MemoDrill.as_view(), name='memo_drill'),
    
    path('memo_record/', MemoRecord.as_view(), name='memo_record'),
    path('memo_review/', MemoReview.as_view(), name='memo_review'),
    
    path('memo_create/', MemoCreate.as_view(), name='memo_create'),
    path('memo_delete/<int:pk>', MemoDelete.as_view(), name='memo_delete'),
    path('memo_update/<int:pk>', MemoUpdate.as_view(), name='memo_update'),

    path('list_word/', WordsList.as_view(), name='list_word'),
    path('list_memo/', MemoList.as_view(), name='list_memo'),
    
    path('send_email/', send_email_view, name='send_email'),

]
