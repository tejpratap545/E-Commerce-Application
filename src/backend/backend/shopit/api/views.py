from ...users.permissions import IsCreator, IsSeller, IsSellerProduct
from .serializers import *
from backend.shopit.models import *
from drf_spectacular.utils import extend_schema
from rest_framework import viewsets
from rest_framework.permissions import AllowAny, IsAdminUser, IsAuthenticated


class BrandViewSet(viewsets.ModelViewSet):

    queryset = Brand.objects.all()
    permission_classes = [IsAdminUser]
    serializer_class = BrandSerializer


class FilterValuesViewSet(viewsets.ModelViewSet):
    queryset = FilterValues.objects.all()
    permission_classes = [IsAdminUser]
    serializer_class = FilterValuesSerializers


class FilterPropertiesViewSet(viewsets.ModelViewSet):
    queryset = FilterProperties.objects.all()
    serializer_class = FilterPropertiesSerializer
    permission_classes = [IsAdminUser]


class FilterCategoryViewSet(viewsets.ModelViewSet):
    serializer_class = FilterCategorySerializer
    queryset = FilterCategory.objects.all()
    permission_classes = [IsAdminUser]


class MiddlePriceRangeViewSet(viewsets.ModelViewSet):
    queryset = MiddlePriceRange.objects.all()
    permission_classes = [IsAdminUser]
    serializer_class = MiddlePriceRangeSerializers


class PriceFilterViewSet(viewsets.ModelViewSet):
    queryset = PriceFilterCategory.objects.all()
    permission_classes = [IsAdminUser]
    serializer_class = PriceFilterCategorySerializers


class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    permission_classes = [IsAdminUser]
    serializer_class = CategorySerializer


class SubCategoryViewSet(viewsets.ModelViewSet):
    queryset = SubCategory.objects.all()
    permission_classes = [IsAdminUser]
    serializer_class = SubCategorySerializers


class AnswerViewSet(viewsets.ModelViewSet):
    queryset = Answer.objects.all()

    serializer_class = AnswerSerializers

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            return [AllowAny]
        elif self.action == "create":
            return [IsAuthenticated]
        else:
            return [IsCreator]


class ProductFAQViewSet(viewsets.ModelViewSet):
    queryset = ProductFAQ.objects.all()

    serializer_class = ProductFAQSerializers

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            return [AllowAny]
        elif self.action == "create":
            return [IsAuthenticated]
        else:
            return [IsCreator]


class CommentOnReviewViewSet(viewsets.ModelViewSet):
    queryset = CommentOnReview.objects.all()

    serializer_class = CommentOnReviewSerializers

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            return [AllowAny]
        elif self.action == "create":
            return [IsAuthenticated]
        else:
            return [IsCreator]


class ReportViewSet(viewsets.ModelViewSet):
    queryset = Report.objects.all()

    serializer_class = ReportSerializers

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            return [AllowAny]
        elif self.action == "create":
            return [IsAuthenticated]
        else:
            return [IsCreator]


class ProductInfoViewSet(viewsets.ModelViewSet):
    queryset = ProductInfo.objects.all()

    serializer_class = ProductInfoSerializers

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            return [AllowAny]
        elif self.action == "create":
            return [IsSeller]
        else:
            return [IsSellerProduct]


class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.all()

    serializer_class = ProductSerializer

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            return [AllowAny]
        elif self.action == "create":
            return [IsSeller]
        else:
            return [IsSellerProduct]
