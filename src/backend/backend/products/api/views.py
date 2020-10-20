from .serializers import (
    BrandSerializer,
    CategorySerializer,
    FilterCategorySerializer,
    FilterPropertiesSerializer,
    MiddlePriceRangeSerializers,
)
from backend.products.models import (
    Brand,
    Category,
    FilterCategory,
    FilterProperties,
    MiddlePriceRange,
)
from rest_framework import viewsets
from rest_framework.permissions import IsAdminUser


class BrandViewSet(viewsets.ModelViewSet):

    queryset = Brand.objects.all()
    authentication_classes = [IsAdminUser]
    serializer_class = BrandSerializer


class FilterCategoryViewSet(viewsets.ModelViewSet):
    serializer_class = FilterCategorySerializer
    queryset = FilterCategory.objects.all()
    authentication_classes = [IsAdminUser]


class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    authentication_classes = [IsAdminUser]
    serializer_class = CategorySerializer


class FilterPropertiesViewSet(viewsets.ModelViewSet):
    queryset = FilterProperties.objects.all()
    serializer_class = FilterPropertiesSerializer
    authentication_classes = [IsAdminUser]


class MiddlePriceRangeViewSet(viewsets.ModelViewSet):
    queryset = MiddlePriceRange.objects.all()
    authentication_classes = [IsAdminUser]
    serializer_class = MiddlePriceRangeSerializers
