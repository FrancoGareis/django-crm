from django.db import models

# Create your models here.

class FirstModel(models.Model):
    name = models.CharField()
    date = models.DateTimeField()

    def __str__(self) -> str:
        return f'{self.pk} -> {self.name}'