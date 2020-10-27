from ...users.permissions import IsCreator, IsSeller, IsSellerProduct
from .serializers import *
from backend.shopit.models import *
from drf_spectacular.utils import extend_schema
from rest_framework import generics, viewsets
from rest_framework.permissions import AllowAny, IsAdminUser, IsAuthenticated


class BrandViewSet(viewsets.ModelViewSet):

    queryset = Brand.objects.all()
    filter_fields = ("category__id",)
    serializer_class = BrandSerializer

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsSeller | IsAdminUser]
        else:
            permission_classes = [IsAdminUser]
        return [permission() for permission in permission_classes]


class FilterValuesTextViewSet(viewsets.ModelViewSet):
    """
    This view is for various filter options of products
    """

    queryset = FilterValuesText.objects.all()

    serializer_class = FilterValuesTextSerializer

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsSeller | IsAdminUser]
        else:
            permission_classes = [IsAdminUser]
        return [permission() for permission in permission_classes]


class AvailableFilterSelectOptionsViewSet(viewsets.ModelViewSet):
    queryset = AvailableFilterSelectOptions.objects.all()

    serializer_class = AvailableFilterSelectOptionsSerializer

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsSeller | IsAdminUser]
        else:
            permission_classes = [IsAdminUser]
        return [permission() for permission in permission_classes]


class FilterValuesSelectViewSet(viewsets.ModelViewSet):
    queryset = FilterValuesSelect.objects.all()

    serializer_class = FilterValuesSelectSerializer

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsSeller | IsAdminUser]
        else:
            permission_classes = [IsAdminUser]
        return [permission() for permission in permission_classes]


class FilterPropertiesViewSet(viewsets.ModelViewSet):
    queryset = FilterProperties.objects.all()
    serializer_class = FilterPropertiesSerializer

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsSeller | IsAdminUser]
        else:
            permission_classes = [IsAdminUser]
        return [permission() for permission in permission_classes]


class FilterCategoryViewSet(viewsets.ModelViewSet):
    serializer_class = FilterCategorySerializer
    queryset = FilterCategory.objects.all()

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsSeller | IsAdminUser]
        else:
            permission_classes = [IsAdminUser]
        return [permission() for permission in permission_classes]


class PriceFilterViewSet(viewsets.ModelViewSet):
    queryset = PriceFilterCategory.objects.all()

    serializer_class = PriceFilterCategorySerializers

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsSeller | IsAdminUser]
        else:
            permission_classes = [IsAdminUser]
        return [permission() for permission in permission_classes]


class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.all()

    serializer_class = CategorySerializer

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsSeller | IsAdminUser]
        else:
            permission_classes = [IsAdminUser]
        return [permission() for permission in permission_classes]


class SubCategoryViewSet(viewsets.ModelViewSet):
    queryset = SubCategory.objects.all()
    filter_fields = ("category__id",)

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsSeller | IsAdminUser]
        else:
            permission_classes = [IsAdminUser]
        return [permission() for permission in permission_classes]

    serializer_class = SubCategorySerializers


class AnswerViewSet(viewsets.ModelViewSet):
    queryset = ProductFAQAnswer.objects.all()

    serializer_class = AnswerSerializers

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsAuthenticated]
        else:
            permission_classes = [IsCreator]

        return [permission() for permission in permission_classes]


class ProductFAQViewSet(viewsets.ModelViewSet):
    queryset = ProductFAQ.objects.all()

    serializer_class = ProductFAQSerializers

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsAuthenticated]
        else:
            permission_classes = [IsCreator]

        return [permission() for permission in permission_classes]


class CommentOnReviewViewSet(viewsets.ModelViewSet):
    queryset = CommentOnReview.objects.all()

    serializer_class = CommentOnReviewSerializers

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsAuthenticated]
        else:
            permission_classes = [IsCreator]

        return [permission() for permission in permission_classes]


class ReportViewSet(viewsets.ModelViewSet):
    queryset = Report.objects.all()

    serializer_class = ReportSerializers

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsAuthenticated]
        else:
            permission_classes = [IsCreator]

        return [permission() for permission in permission_classes]


class ProductInfoViewSet(viewsets.ModelViewSet):
    queryset = ProductInfo.objects.all()

    serializer_class = ProductInfoSerializers

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsSeller]
        else:
            permission_classes = [IsSellerProduct]

        return [permission() for permission in permission_classes]


class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.all()

    serializer_class = ProductSerializer

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsSeller]
        else:
            permission_classes = [IsSellerProduct]
        return [permission() for permission in permission_classes]


class SellerProducts(generics.ListAPIView):
    serializer_class = SellerProductsListSerializer
    permission_classes = [IsSeller]

    def get_queryset(self):
        return ProductInfo.objects.only(
            "id",
            "name",
            "category",
            "brand",
            "image",
            "stoke",
            "is_available",
            "created_at",
        ).filter(self.request.user)
