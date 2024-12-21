from django.contrib import admin
from .models import WordsModel, MemoModel, McModel, ListSentenceModel

class ListSentenceModelAdmin(admin.ModelAdmin):
    list_display = ('word','source','eval','eibun','wayaku','created_at','user','pk')
    search_fields = ('word','source','eval','eibun','wayaku','created_at','user','pk')



class McModelAdmin(admin.ModelAdmin):
    list_display = ('memo1','memo2', 'user', 'reg_date','pk')
    search_fields = ('memo1','memo2', 'user', 'reg_date','pk')

class MemoModelAdmin(admin.ModelAdmin):
    list_display = ('memo', 'user', 'reg_date')
    search_fields = ('memo', 'user')
    
class WordsModelAdmin(admin.ModelAdmin):
    list_display = ('word','mean1','mean2', 'user', 'reg_date')
    search_fields = ('word','mean1','mean2', 'user')
    
admin.site.register(ListSentenceModel, ListSentenceModelAdmin)
admin.site.register(WordsModel, WordsModelAdmin)
admin.site.register(MemoModel, MemoModelAdmin)
admin.site.register(McModel, McModelAdmin)

