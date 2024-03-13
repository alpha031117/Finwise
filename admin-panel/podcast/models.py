from django.db import models

class Podcast(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    host = models.CharField(max_length=100)
    cover_image = models.ImageField(upload_to='podcast_covers/', null=True, blank=True)
    session_date = models.DateField()
    session_time = models.TimeField()
    published_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title

