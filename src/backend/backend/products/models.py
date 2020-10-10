from django.db import models
from djmoney.models.fields import MoneyField


# Create your models here.


class Product(models.Model):
    id = models.BigIntegerField(primary_key=True, auto_created=True, unique=True)
    name = models.CharField(max_length=500, blank=False, null=False)
    description = models.TextField()
    original_price = MoneyField(max_digits=14, decimal_places=2, default_currency="IN")
    current_price = MoneyField(max_digits=14, decimal_places=2, default_currency="IN")
