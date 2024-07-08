from django.contrib import admin
from django.urls import path,include
from .views import WordsList, WordsCreate, WordsDelete, WordsUpdate

app_name = 'wlist'

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('', WordsList.as_view(), name='wlist'),
    # path('detail/<int:pk>', TodoDetail.as_view(), name='detail'),
    path('create/', WordsCreate.as_view(), name='create'),
    path('delete/<int:pk>', WordsDelete.as_view(), name='delete'),
    path('update/<int:pk>', WordsUpdate.as_view(), name='update'),

]
