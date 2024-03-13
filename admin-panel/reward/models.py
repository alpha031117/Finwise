from django.db import models

class Reward(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    points_required = models.PositiveIntegerField()
    image = models.ImageField(upload_to='reward_images/', null=True, blank=True)
    available = models.BooleanField(default=True)
    published_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
