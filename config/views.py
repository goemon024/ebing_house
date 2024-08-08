from django.views.generic import TemplateView
from django.utils.timezone import now
from django.contrib.auth.mixins import LoginRequiredMixin

class CustomTemplateView(LoginRequiredMixin, TemplateView):
    template_name = 'home.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['start_date'] = now().date()
        context['end_date'] = now().date()
        return context