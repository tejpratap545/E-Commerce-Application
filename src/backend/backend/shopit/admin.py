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
    list_display = ("name", "min_possible_value", "max_possible_value", "created_at")


@admin.register(AvailableFilterSelectOptions)
class AvailableFilterSelectOptionsAdmin(CustomAdmin):
    list_display = ("name", "created_at", "value")


@admin.register(FilterValuesSelect)
class FilterValuesSelectAdmin(CustomAdmin):
    list_display = ("name", "created_at")
    filter_horizontal = ("available_options",)


@admin.register(FilterProperties)
class FilterPropertiesAdmin(CustomAdmin):
    ist_display = ("name", "created_at")
    filter_horizontal = (
        "filter_values",
        "select_values",
    )


@admin.register(FilterCategory)
class FilterCategoryAdmin(CustomAdmin):
    list_display = ("name", "created_at")
    filter_horizontal = ("properties",)


@admin.register(PriceFilterCategory)
class PriceFilterCategoryAdmin(CustomAdmin):
    ist_display = ("name", "created_at", "under_price", "above_price")


@admin.register(Category)
class CategoryAdmin(CustomAdmin):
    list_display = ("name", "created_at")
    list_filter = ["brands"]
    filter_horizontal = ("brands",)


@admin.register(SubCategory)
class SubCategoryAdmin(CustomAdmin):
    list_display = ("name", "created_at")
    filter_horizontal = (
        "price_filter_category",
        "filter_category",
        "category",
    )


@admin.register(ProductFAQAnswer)
class ProductFAQAnswerAdmin(CustomAdmin):
    list_display = (
        "created_by",
        "created_at",
    )
    list_filter = ["created_by"]


@admin.register(ProductFAQ)
class ProductFAQAdmin(CustomAdmin):
    list_display = (
        "created_by",
        "created_at",
    )
    filter_horizontal = ["answers"]
    list_filter = ["created_by"]


@admin.register(CommentOnReview)
class CommentOnReviewAdmin(CustomAdmin):
    list_display = ("created_by", "created_at")


@admin.register(Report)
class ReportAdmin(CustomAdmin):
    list_display = ("created_by", "is_critical", "created_at")


@admin.register(ProductReview)
class ProductReviewAdmin(CustomAdmin):
    list_display = ("created_by", "rating", "is_verified_purchase", "created_at")
    filter_horizontal = ["comments", "reports"]


@admin.register(ProductInfo)
class ProductInfoAdmin(CustomAdmin):
    list_display = ("name", "stock", "seller")
    list_filter = ["brand", "category", "sub_categories", "seller"]
    filter_horizontal = ("faqs", "reviews", "sub_categories")
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
            "Product Category",
            {
                "fields": ("brand", "category", "sub_categories", "tags"),
            },
        ),
        (
            "reviews and faqs",
            {"fields": ("reviews", "faqs")},
        ),
    )


@admin.register(Product)
class ProductAdmin(CustomAdmin):
    list_display = (
        "name",
        "info",
        "stock",
        "original_price",
        "current_price",
        "created_at",
    )
    list_filter = ["info"]
    search_fields = ["name"]
    raw_id_fields = ("info",)
