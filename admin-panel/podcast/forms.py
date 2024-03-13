from django import forms
from .models import Podcast

class PodcastForm(forms.ModelForm):
    class Meta:
        model = Podcast
        fields = ['title', 'description', 'host', 'cover_image', 'session_date', 'session_time']
        widgets = {
            'session_date': forms.DateInput(attrs={'type': 'date'}),
            'session_time': forms.TimeInput(attrs={'type': 'time'}),
        }
