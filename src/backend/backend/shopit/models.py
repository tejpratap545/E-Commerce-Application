# # Create your models here.
from backend.users.models import Seller, User
from django.db import models
from django_better_admin_arrayfield.models.fields import ArrayField
from djmoney.models.fields import MoneyField


class Brand(models.Model):
    name = models.CharField(max_length=30, blank=False, null=False)
    image = models.ImageField(upload_to="brand/image", blank=True, null=True)
    tags = ArrayField(models.TextField())
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class FilterValues(models.Model):
    value = models.CharField(max_length=50)

    def __str__(self):
        return self.value


class FilterProperties(models.Model):
    name = models.CharField(max_length=30, blank=False, null=False)
    value = models.ManyToManyField(FilterValues)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class FilterCategory(models.Model):
    name = models.CharField(max_length=50, blank=False, null=False)
    properties = models.ManyToManyField(
        FilterProperties,
    )
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

    brand = models.ManyToManyField(
        Brand, related_name="brand", related_query_name="brand"
    )
    tags = ArrayField(models.TextField())
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Category"
        verbose_name_plural = "Categories"


class SubCategory(models.Model):
    name = models.CharField(max_length=20)
    price_filter_category = models.ManyToManyField(
        PriceFilterCategory,
    )
    filter_category = models.ManyToManyField(
        FilterCategory,
    )
    category = models.ManyToManyField(Category)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "SubCategory"
        verbose_name_plural = "SubCategories"


class ProductFAQAnswer(models.Model):
    answer = models.TextField()
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.created_by.email


class ProductFAQ(models.Model):
    question = models.TextField()
    answer = models.ManyToManyField(ProductFAQAnswer)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.created_by.email


class CommentOnReview(models.Model):
    comment = models.TextField()
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.created_by.email


class Report(models.Model):
    created_by = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="user_report",
        related_query_name="user_reports",
    )
    description = models.TextField()
    is_critical = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.created_by.email


class ProductReview(models.Model):
    rating = models.SmallIntegerField()
    user = models.ManyToManyField(User)
    description = models.TextField()
    comments = models.ManyToManyField(CommentOnReview)
    is_verified_purchase = models.BooleanField(default=False)
    report = models.ManyToManyField(Report)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.is_verified_purchase


class ProductInfo(models.Model):
    name = models.CharField(max_length=500, blank=False, null=False)
    image = models.ImageField(
        upload_to="product/image",
    )
    is_available = models.BooleanField(default=True)
    stoke = models.IntegerField(default=1)
    description = models.TextField()
    brand = models.ForeignKey(Brand, on_delete=models.SET_NULL, null=True)
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True)
    sub_category = models.ManyToManyField(SubCategory)
    seller = models.ManyToManyField(Seller)

    tags = ArrayField(models.TextField())
    faq = models.ManyToManyField(ProductFAQ)
    review = models.ManyToManyField(ProductReview)
    product_detail = models.JSONField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Product(models.Model):
    media = ArrayField(models.URLField(), null=True)

    info = models.ForeignKey(ProductInfo, on_delete=models.CASCADE)
    purchase_option = models.JSONField()

    filter_details = models.JSONField()

    original_price = MoneyField(max_digits=14, decimal_places=2, default_currency="INR")
    current_price = MoneyField(max_digits=14, decimal_places=2, default_currency="INR")

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.info.created_at
