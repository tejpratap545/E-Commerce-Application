from backend.products.models import (
    Brand,
    Category,
    FilterCategory,
    FilterProperties,
    MiddlePriceRange,
)
from rest_framework import serializers


class FilterCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = FilterCategory
        fields = "__all__"


class FilterPropertiesSerializer(serializers.ModelSerializer):
    class Meta:
        model = FilterProperties
        fields = "__all__"


class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = "__all__"


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = "__all__"


class MiddlePriceRangeSerializers(serializers.ModelSerializer):
    class Meta:
        model = MiddlePriceRange
        fields = "__all__"

