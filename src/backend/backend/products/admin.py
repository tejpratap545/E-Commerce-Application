# Register your models here.
from .models import (
    Brand,
    Category,
    FilterCategory,
    FilterProperties,
    MiddlePriceRange,
    Product,
)
from django.contrib import admin


admin.site.register(Product)

admin.site.register(Brand)

admin.site.register(Category)

admin.site.register(FilterCategory)

admin.site.register(FilterProperties)

admin.site.register(MiddlePriceRange)
