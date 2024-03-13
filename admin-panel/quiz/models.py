from django.db import models
from django.utils import timezone
from base.models import InfoType

class Quiz(models.Model):
    PUBLISHED = 'Published'
    NOT_PUBLISHED = 'Not Published'

    INFO_TYPE_CHOICES = [
        (PUBLISHED, 'Published'),
        (NOT_PUBLISHED, 'Not Published'),
    ]

    info_type = models.ForeignKey(InfoType, on_delete=models.CASCADE, default=None)
    question_text = models.TextField()
    status = models.CharField(max_length=20, choices=INFO_TYPE_CHOICES)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.question_text

class Choice(models.Model):
    question = models.ForeignKey(Quiz, on_delete=models.CASCADE, related_name='choices')
    choice_text = models.CharField(max_length=255)
    is_correct = models.BooleanField(default=False)

    def __str__(self):
        return self.choice_text

