from ...users.permissions import IsCreator, IsSeller, IsSellerProduct
from .serializers import *
from backend.shopit.models import *
from django.db.models import Avg, Count, Q
from django.shortcuts import get_object_or_404
from drf_spectacular.utils import extend_schema
from rest_framework import generics, viewsets
from rest_framework.pagination import PageNumberPagination
from rest_framework.permissions import AllowAny, IsAdminUser, IsAuthenticated
from rest_framework.response import Response


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

    serializer_class = PriceFilterCategorySerializer

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

    serializer_class = SubCategorySerializer


class AnswerViewSet(viewsets.ModelViewSet):
    queryset = ProductFAQAnswer.objects.all()

    serializer_class = ProductFAQAnswerSerializer

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

    serializer_class = ProductFAQSerializer

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

    serializer_class = CommentOnReviewSerializer

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

    serializer_class = ReportSerializer

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsAuthenticated]
        else:
            permission_classes = [IsCreator]

        return [permission() for permission in permission_classes]


# get the product rating information based on product id
product_rating1 = Count("info__reviews__rating", filter=Q(info__reviews__rating=1))
product_rating2 = Count("info__reviews__rating", filter=Q(info__reviews__rating=2))
product_rating3 = Count("info__reviews__rating", filter=Q(info__reviews__rating=3))
product_rating4 = Count("info__reviews__rating", filter=Q(info__reviews__rating=4))
product_rating5 = Count("info__reviews__rating", filter=Q(info__reviews__rating=4))
product_rating_avg = Avg("info__reviews__rating")
# get the product rating information based on product info id
product_info_rating1 = Count("reviews__rating", filter=Q(reviews__rating=1))
product_info__rating2 = Count("reviews__rating", filter=Q(reviews__rating=2))
product_info__rating3 = Count("reviews__rating", filter=Q(reviews__rating=3))
product_info__rating4 = Count("reviews__rating", filter=Q(reviews__rating=4))
product_info__rating5 = Count("reviews__rating", filter=Q(reviews__rating=4))
product_info__rating_avg = Avg("reviews__rating")


class ProductInfoViewSet(viewsets.ModelViewSet):
    queryset = ProductInfo.objects.all().annotate(
        rating1=product_info_rating1,
        rating2=product_info__rating2,
        rating3=product_info__rating3,
        rating4=product_info__rating4,
        rating5=product_info__rating5,
        rating_avg=product_info__rating_avg,
    )
    filter_fields = (
        "brand__id",
        "category__id",
        "sub_categories__id",
    )
    ordering_fields = ["created_at", "updated_at"]
    search_fields = ["@name", "@brand"]

    def get_serializer_class(self):
        if self.action == "list":
            return ProductInfoListSerializer
        else:
            return ProductInfoSerializer

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
    filter_fields = ("info__id",)
    pagination_class = PageNumberPagination
    page_size = 20
    serializer_class = ProductSerializer

    def get_permissions(self):
        if self.action == "list" or "retrieve":
            permission_classes = [AllowAny]
        elif self.action == "create":
            permission_classes = [IsSeller]
        else:
            permission_classes = [IsSellerProduct]
        return [permission() for permission in permission_classes]


class SellerProductsViewSet(viewsets.ReadOnlyModelViewSet):

    permission_classes = [IsAuthenticated & IsSeller]
    filter_fields = (
        "brand__id",
        "category__id",
        "sub_categories__id",
    )
    ordering_fields = ["created_at", "updated_at"]
    search_fields = ["@name", "@brand"]
    pagination_class = PageNumberPagination
    page_size = 20

    serializer_class = SellerProductsListSerializer

    def get_queryset(self):
        return (
            ProductInfo.objects.only(
                "id",
                "name",
                "category",
                "brand",
                "image",
                "created_at",
            )
            .filter(seller=Seller.objects.only("user").get(user=self.request.user))
            .annotate(
                rating1=product_info_rating1,
                rating2=product_info__rating2,
                rating3=product_info__rating3,
                rating4=product_info__rating4,
                rating5=product_info__rating5,
                rating_avg=product_info__rating_avg,
            )
        )


class ViewProductView(generics.RetrieveAPIView):
    serializer_class = FullProductSerializer
    lookup_field = "pk"
    queryset = Product.objects.annotate(
        rating1=product_rating1,
        rating2=product_rating2,
        rating3=product_rating3,
        rating4=product_rating4,
        rating5=product_rating5,
        rating_avg=product_rating_avg,
    )


class ViewProductInfoView(generics.RetrieveAPIView):
    serializer_class = FullProductSerializer

    def get_object(self):
        obj = Product.objects.filter(info=self.kwargs["pk"]).annotate(
            rating1=product_rating1,
            rating2=product_rating2,
            rating3=product_rating3,
            rating4=product_rating4,
            rating5=product_rating5,
            rating_avg=product_rating_avg,
        )[0]
        return obj
