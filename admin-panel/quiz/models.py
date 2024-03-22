from django.db import models
from django.utils import timezone
from base.models import InfoType

class Quiz(models.Model):
    PUBLISHED = 'Published'
    NOT_PUBLISHED = 'Not Published'
    MCQ = 'MCQ'
    TRUE_FALSE = 'True/False'

    INFO_TYPE_CHOICES = [
        (PUBLISHED, 'Published'),
        (NOT_PUBLISHED, 'Not Published'),
    ]

    QUESTION_TYPE_CHOICES = [
        (MCQ, 'MCQ'),
        (TRUE_FALSE, 'True/False'),
    ]

    info_type = models.ForeignKey(InfoType, on_delete=models.CASCADE, default=None)
    question_text = models.TextField()
    question_type = models.CharField(max_length=20, choices=QUESTION_TYPE_CHOICES, default=MCQ)
    status = models.CharField(max_length=20, choices=INFO_TYPE_CHOICES)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.question_text

class Choice(models.Model):
    question = models.ForeignKey(Quiz, on_delete=models.CASCADE, related_name='choices')
    choice_text = models.CharField(max_length=255, blank=True, null=True)
    choice_true_false = models.BooleanField(null=True, blank=True)  # Updated to BooleanField(null=True, blank=True)
    is_correct = models.BooleanField(default=False)

    def save(self, *args, **kwargs):
        if self.question.question_type == Quiz.MCQ:
            # If the question type is MCQ, reset choice_true_false and keep choice_text as it is
            self.choice_true_false = None
        elif self.question.question_type == Quiz.TRUE_FALSE:
            # If the question type is True/False, set choice_text based on choice_true_false
            self.choice_text = str(self.choice_true_false)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.choice_text

