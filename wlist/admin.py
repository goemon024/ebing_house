from django.contrib import admin
from .models import WordsModel, MemoModel



class MemoModelAdmin(admin.ModelAdmin):
    list_display = ('memo', 'user', 'reg_date')
    search_fields = ('memo', 'user')
    
class WordsModelAdmin(admin.ModelAdmin):
    list_display = ('word','mean1','mean2', 'user', 'reg_date')
    search_fields = ('word','mean1','mean2', 'user')
    
admin.site.register(WordsModel, WordsModelAdmin)
admin.site.register(MemoModel, MemoModelAdmin)
