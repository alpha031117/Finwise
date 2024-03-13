from django.db import models
from django.utils import timezone
from base.models import InfoType

# Create your models here.
class News(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField()
    author =  models.CharField(max_length=50)
    posted_at = models.DateTimeField(auto_now_add=True)
    info_type = models.ForeignKey(InfoType, on_delete=models.CASCADE, default=None)
    image = models.ImageField(upload_to='news_images/', null=True)
    likes = models.IntegerField(default=0)  # New field for storing like count
    comments = models.IntegerField(default=0)  # New field for storing comment count

    def __str__(self):
        return self.title
    
class Comment(models.Model):
    news = models.ForeignKey(News, on_delete=models.CASCADE)
    author = models.CharField(max_length=50)
    content = models.TextField()
    posted_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return f"Comment by {self.author} on {self.news.title}"
