from django.utils.text import slugify
from django.db import models, IntegrityError

class Domain(models.Model):
    name = models.CharField(max_length=255, unique=True)
    slug = models.SlugField(unique=True, blank=True)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name)
            original_slug = self.slug
            counter = 1
            while True:
                try:
                    super().save(*args, **kwargs)
                    break
                except IntegrityError:
                    self.slug = f"{original_slug}-{counter}"
                    counter += 1
        else:
            super().save(*args, **kwargs)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                models.functions.Upper("name"),
                name="unique_domain_upper_name",
            ),
        ]


class InfoType(models.Model):
    NEWS = 'News'
    QUIZ = 'Quizes'
    INFO_TYPE_CHOICES = [
        (NEWS, 'News'),
        (QUIZ, 'Quizes'),
    ]
    
    type = models.CharField(max_length=10, choices=INFO_TYPE_CHOICES)
    domain = models.ForeignKey(Domain, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.get_type_display()} - {self.domain.name}"

