from django.shortcuts import render, get_object_or_404
from .models import Podcast, Episode
from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from admin_accounts.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from mutagen.mp3 import MP3

@login_required(login_url=reverse_lazy('accounts:login'))
def all_podcast(request):
    podcast = Podcast.objects.all()
    return render(request, 'podcast/all_podcast.html', {'podcasts': podcast})

@login_required(login_url=reverse_lazy('accounts:login'))
def all_episode(request, podcast_slug):
    podcast = get_object_or_404(Podcast, podcast_slug=podcast_slug)
    episodes_with_podcast = Episode.objects.filter(podcast=podcast).select_related('podcast')
    return render(request, 'podcast/episode_list.html', {'episode_podcasts': episodes_with_podcast, 'podcast': podcast})

class PodcastCreateView(LoginRequiredMixin, CreateView):
    model = Podcast
    fields = ['title', 'description', 'host', 'cover_image']  # Add fields as needed
    template_name = 'podcast/podcast_form.html'  # Specify your template name
    success_url = reverse_lazy('podcast:podcast-create')  # Specify your success URL name

class EpisodeCreateView(LoginRequiredMixin, CreateView):
    model = Episode
    fields = ['title', 'description', 'audio_file']  # Add fields as needed
    template_name = 'podcast/episode_form.html'  # Specify your template name
    success_url = reverse_lazy('podcast:podcast-list')  # Specify your success URL name

    def form_valid(self, form):
        podcast = get_object_or_404(Podcast, podcast_slug=self.kwargs['podcast_slug'])
        form.instance.podcast = podcast
        audio_file = form.cleaned_data['audio_file']
        # Load the MP3 file
        audio = MP3(audio_file.temporary_file_path())
        audio_info = audio.info    
        length_in_secs = int(audio_info.length)
        duration_in_minutes = (length_in_secs / 60) - 0.03
        form.instance.duration_in_minutes = round(duration_in_minutes, 2)
        return super().form_valid(form)