from django.db import models
from django.utils.text import slugify
from django.db import IntegrityError

class Podcast(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    host = models.CharField(max_length=100)
    cover_image = models.ImageField(upload_to='podcast_covers/', null=True, blank=True)
    published_at = models.DateTimeField(auto_now_add=True)
    podcast_slug = models.SlugField(unique=True, blank=True)

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        if not self.podcast_slug:
            self.slug = slugify(self.name)
            original_slug = self.podcast_slug
            counter = 1
            while True:
                try:
                    super().save(*args, **kwargs)
                    break
                except IntegrityError:
                    self.podcast_slug = f"{original_slug}-{counter}"
                    counter += 1
        else:
            super().save(*args, **kwargs)

    def __str__(self):
        return self.title

class Episode(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    podcast = models.ForeignKey(Podcast, on_delete=models.CASCADE, related_name='episodes')
    audio_file = models.FileField(upload_to='audio_files/')
    release_date = models.DateTimeField(auto_now_add=True)
    duration_in_minutes = models.FloatField(null=True, blank=True)

    def __str__(self): 
        return self.title

