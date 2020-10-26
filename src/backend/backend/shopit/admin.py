# Register your models here.
from .models import *  # Product,
from django.contrib import admin
from django.contrib.postgres.fields import ArrayField
from django.db.models import JSONField
from django_better_admin_arrayfield.admin.mixins import DynamicArrayMixin
from django_better_admin_arrayfield.forms.fields import DynamicArrayField
from django_better_admin_arrayfield.forms.widgets import DynamicArrayTextareaWidget
from jsoneditor.forms import JSONEditor


class CustomAdmin(admin.ModelAdmin, DynamicArrayMixin):
    formfield_overrides = {
        JSONField: {"widget": JSONEditor},
    }


@admin.register(Brand)
class BrandAdmin(CustomAdmin):
    pass


@admin.register(Product)
class ProductAdmin(CustomAdmin):
    pass


@admin.register(Category)
class CategoryAdmin(CustomAdmin):
    pass


@admin.register(FilterCategory)
class FilterCategoryAdmin(CustomAdmin):
    pass


@admin.register(FilterProperties)
class FilterPropertiesAdmin(CustomAdmin):
    pass


@admin.register(MiddlePriceRange)
class MiddlePriceRangeAdmin(CustomAdmin):
    pass


@admin.register(FilterValues)
class FilterValuesAdmin(CustomAdmin):
    pass


@admin.register(SubCategory)
class SubCategoryAdmin(CustomAdmin):
    pass


@admin.register(CommentOnReview)
class CommentOnReviewAdmin(CustomAdmin):
    pass


@admin.register(Report)
class ReportAdmin(CustomAdmin):
    pass


@admin.register(ProductReview)
class ProductReviewAdmin(CustomAdmin):
    pass


@admin.register(ProductInfo)
class ProductInfoAdmin(CustomAdmin):
    pass
