# # Create your models here.
from backend.users.models import Seller, User
from django.db import models
from django_better_admin_arrayfield.models.fields import ArrayField
from djmoney.models.fields import MoneyField


class Brand(models.Model):
    name = models.CharField(max_length=100, blank=False, null=False)
    image = models.ImageField(upload_to="brand/image", blank=True, null=True)
    tags = ArrayField(models.TextField(), blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"brand {self.name}"


class FilterValuesText(models.Model):
    name = models.CharField(max_length=100, null=True)
    min_possible_value = models.CharField(max_length=30, blank=True, null=True)
    max_possible_value = models.CharField(max_length=30, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.name}"


FilterPropertyChoices = (
    ("S", "SELECT"),
    ("T", "TEXT"),
)


class AvailableFilterSelectOptions(models.Model):
    name = models.CharField(max_length=100, null=True)
    value = models.CharField(max_length=100, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.name} "


class FilterValuesSelect(models.Model):
    name = models.CharField(max_length=100, blank=True, null=True)
    available_options = models.ManyToManyField(AvailableFilterSelectOptions, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.name} "


class FilterProperties(models.Model):
    name = models.CharField(max_length=100, blank=False, null=False)
    property_type = models.CharField(
        max_length=1, choices=FilterPropertyChoices, default="S"
    )

    filter_values = models.ManyToManyField(FilterValuesText, blank=True)
    select_values = models.ManyToManyField(FilterValuesSelect, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.name} "


class FilterCategory(models.Model):
    name = models.CharField(max_length=100, blank=False, null=False)
    properties = models.ManyToManyField(FilterProperties, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.name} "

    class Meta:
        verbose_name = "FilterCategory"
        verbose_name_plural = "FilterCategories"


class PriceFilterCategory(models.Model):
    name = models.CharField(max_length=100)
    under_price = MoneyField(max_digits=14, decimal_places=2, default_currency="INR")
    middle_price = MoneyField(max_digits=14, decimal_places=2, default_currency="INR")
    above_price = MoneyField(max_digits=14, decimal_places=2, default_currency="INR")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.name} "

    class Meta:
        verbose_name = "PriceFilterCategory"
        verbose_name_plural = "PriceFilterCategories"


class Category(models.Model):
    name = models.CharField(max_length=100, blank=False, null=False)

    brand = models.ManyToManyField(Brand, blank=True)
    tags = ArrayField(models.TextField(), blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.name} "

    class Meta:
        verbose_name = "Category"
        verbose_name_plural = "Categories"


class SubCategory(models.Model):
    name = models.CharField(max_length=100)
    price_filter_category = models.ManyToManyField(PriceFilterCategory, blank=True)
    filter_category = models.ManyToManyField(FilterCategory, blank=True)
    category = models.ManyToManyField(Category)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.name} "

    class Meta:
        verbose_name = "SubCategory"
        verbose_name_plural = "SubCategories"


class ProductFAQAnswer(models.Model):
    answer = models.TextField()
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"self.created_by.email"


class ProductFAQ(models.Model):
    question = models.TextField()
    answer = models.ManyToManyField(ProductFAQAnswer, blank=True)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"self.created_by.email"


class CommentOnReview(models.Model):
    comment = models.TextField()
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.created_by.email} date {self.created_at}"


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
        return f"{self.created_by.email} critical : {self.is_critical}"


class ProductReview(models.Model):
    rating = models.SmallIntegerField()
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    description = models.TextField()
    comments = models.ManyToManyField(CommentOnReview, blank=True)
    is_verified_purchase = models.BooleanField(default=False)
    report = models.ManyToManyField(Report, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"rating: {self.rating} : report: {self.report}"


class ProductInfo(models.Model):
    name = models.CharField(max_length=500, blank=False, null=False)
    seller = models.ForeignKey(
        Seller,
        on_delete=models.SET_NULL,
        null=True,
    )
    image = models.ImageField(upload_to="product/image", blank=True, null=True)

    description = models.TextField()
    brand = models.ForeignKey(Brand, on_delete=models.SET_NULL, null=True, blank=True)
    category = models.ForeignKey(
        Category, on_delete=models.SET_NULL, null=True, blank=True
    )
    sub_category = models.ManyToManyField(SubCategory, blank=True)

    tags = ArrayField(models.TextField(), null=True)

    faq = models.ManyToManyField(ProductFAQ, blank=True)
    review = models.ManyToManyField(ProductReview, blank=True)

    product_detail = models.JSONField()

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"name:{self.name} brand:{self.brand} stoke:{self.stock}"

    @property
    def stock(self):
        return self.product_set.all().count()

    @property
    def is_available(self):
        return True if self.stock > 0 else False


class Product(models.Model):
    media = ArrayField(models.URLField(), null=True, blank=True)
    name = models.CharField(max_length=100, blank=True, null=True)
    info = models.ForeignKey(ProductInfo, on_delete=models.CASCADE)
    stock = models.PositiveIntegerField(default=1, blank=True, null=True)
    popularity = models.SmallIntegerField(default=5, blank=True, null=True)
    purchase_option = models.JSONField()

    product_details = models.JSONField()

    original_price = MoneyField(max_digits=14, decimal_places=2, default_currency="INR")
    current_price = MoneyField(max_digits=14, decimal_places=2, default_currency="INR")

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"name {self.info.name} current price : {self.current_price}"

    @property
    def is_available(self):
        return True if self.stock > 0 else False
