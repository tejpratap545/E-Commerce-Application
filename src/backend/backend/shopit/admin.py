# Register your models here.
from .models import *  # Product,
from django.contrib import admin
from django.db.models import JSONField
from django_better_admin_arrayfield.admin.mixins import DynamicArrayMixin
from jsoneditor.forms import JSONEditor


class CustomAdmin(admin.ModelAdmin, DynamicArrayMixin):
    formfield_overrides = {
        JSONField: {"widget": JSONEditor},
    }


@admin.register(Brand)
class BrandAdmin(CustomAdmin):
    list_display = ("name", "created_at")


@admin.register(FilterValuesText)
class FilterValuesTextAdmin(CustomAdmin):
    list_display = ("name", "min_possible_value", "max_possible_value")


@admin.register(AvailableFilterSelectOptions)
class AvailableFilterSelectOptionsAdmin(CustomAdmin):
    pass


@admin.register(FilterValuesSelect)
class FilterValuesSelectAdmin(CustomAdmin):
    list_display = ("name",)


@admin.register(FilterProperties)
class FilterPropertiesAdmin(CustomAdmin):
    filter_horizontal = (
        "filter_values",
        "select_values",
    )


@admin.register(FilterCategory)
class FilterCategoryAdmin(CustomAdmin):
    list_display = ("name", "created_at")


@admin.register(PriceFilterCategory)
class PriceFilterCategoryAdmin(CustomAdmin):
    pass


@admin.register(Category)
class CategoryAdmin(CustomAdmin):
    list_display = ("name", "created_at")
    list_filter = ["brand"]


@admin.register(SubCategory)
class SubCategoryAdmin(CustomAdmin):
    filter_horizontal = (
        "price_filter_category",
        "filter_category",
        "category",
    )


@admin.register(ProductFAQ)
class ProductFAQAdmin(CustomAdmin):
    list_display = (
        "created_by",
        "created_at",
    )
    list_filter = ["answer"]


@admin.register(CommentOnReview)
class CommentOnReviewAdmin(CustomAdmin):
    list_display = ("created_by", "created_at")


@admin.register(Report)
class ReportAdmin(CustomAdmin):
    list_display = ("created_by", "is_critical", "created_at")


@admin.register(ProductReview)
class ProductReviewAdmin(CustomAdmin):
    list_display = ("user", "rating", "is_verified_purchase", "created_at")
    list_filter = ["comments", "report"]


@admin.register(ProductInfo)
class ProductInfoAdmin(CustomAdmin):
    list_display = ("name", "is_available", "stoke", "seller")
    list_filter = ["brand", "category", "sub_category", "seller"]
    filter_horizontal = ("faq", "review", "sub_category")
    fieldsets = (
        (
            "Product",
            {"fields": ("name", "seller", "image")},
        ),
        (
            "Product Detail",
            {"fields": ("description", "product_detail")},
        ),
        (
            "availability",
            {
                "fields": (
                    "is_available",
                    "stoke",
                )
            },
        ),
        (
            "Product Category",
            {
                "fields": ("brand", "category", "sub_category", "tags"),
            },
        ),
        (
            "reviews and faqs",
            {"fields": ("review", "faq")},
        ),
    )


@admin.register(Product)
class ProductAdmin(CustomAdmin):
    list_display = ("info", "original_price", "current_price", "created_at")
