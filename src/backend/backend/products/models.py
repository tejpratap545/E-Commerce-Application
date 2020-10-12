from django.contrib.postgres.fields import ArrayField
from django.db import models
from djmoney.models.fields import MoneyField


# # Create your models here.


class FilterProperties(models.Model):
    name = models.CharField(max_length=30, blank=False, null=False)
    value = models.CharField(max_length=30, blank=False, null=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Brand(models.Model):
    name = models.CharField(max_length=30, blank=False, null=False)
    tags = ArrayField(models.CharField(max_length=200), blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class FilterCategory(models.Model):
    name = models.CharField(max_length=50, blank=False, null=False)
    properties = models.ManyToManyField(FilterProperties, related_name="FilterProperty",
                                        related_query_name="FilterProperties")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "FilterCategory"
        verbose_name_plural = "FilterCategories"


class MiddlePriceRange(models.Model):
    name = models.CharField(blank=True, null=True, max_length=20)
    start_price = MoneyField(max_digits=14, decimal_places=2, default_currency="INR")
    end_price = MoneyField(max_digits=14, decimal_places=2, default_currency="INR")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "MiddlePriceRange"
        verbose_name_plural = "MiddlePriceRanges"


class PriceFilterCategory(models.Model):
    name = models.CharField(max_length=30)
    under_price = MoneyField(max_digits=14, decimal_places=2, default_currency="INR")
    middle_price = MoneyField(max_digits=14, decimal_places=2, default_currency="INR")
    above_price = MoneyField(max_digits=14, decimal_places=2, default_currency="INR")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "PriceFilterCategory"
        verbose_name_plural = "PriceFilterCategories"


class Category(models.Model):
    name = models.CharField(max_length=20, blank=False, null=False)
    price_filter_category = models.ManyToManyField(
        PriceFilterCategory, related_name="price_filter_category", related_query_name="price_filter_categories")
    filter_category = models.ManyToManyField(
        FilterCategory, related_name="filter_category", related_query_name="filter_categories")
    brand = models.ManyToManyField(Brand, related_name="brand", related_query_name="brand")
    tags = ArrayField(models.CharField(max_length=200), blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Category"
        verbose_name_plural = "Categories"


class Product(models.Model):
    name = models.CharField(max_length=500, blank=False, null=False)
    is_available = models.BooleanField(default=True)
    stoke = models.IntegerField(default=1)
    description = models.TextField()
    original_price = MoneyField(max_digits=14, decimal_places=2, default_currency="INR")
    current_price = MoneyField(max_digits=14, decimal_places=2, default_currency="INR")
    brand = models.ForeignKey(Brand, on_delete=models.SET_NULL, null=True)
    tags = ArrayField(models.CharField(max_length=200), blank=True)
    product_detail = models.JSONField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name
