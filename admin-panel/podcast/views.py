from django.shortcuts import render
from .models import Podcast
from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from .forms import PodcastForm
from admin_accounts.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required

@login_required(login_url=reverse_lazy('accounts:login'))
def all_podcast(request):
    podcast = Podcast.objects.all()
    return render(request, 'podcast/all_podcast.html', {'podcasts': podcast})

class PodcastCreateView(LoginRequiredMixin, CreateView):
    model = Podcast
    form_class = PodcastForm
    template_name = 'podcast/podcast_form.html'  # Specify your template name
    success_url = reverse_lazy('podcast:podcast-create')  # Specify your success URL name