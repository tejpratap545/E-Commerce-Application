from backend.shopit.models import *
from backend.users.models import User
from rest_framework import serializers


# basic serializers for general  CRUD operations
class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = "__all__"


class FilterValuesTextSerializer(serializers.ModelSerializer):
    class Meta:
        model = FilterValuesText
        fields = "__all__"


class AvailableFilterSelectOptionsSerializer(serializers.ModelSerializer):
    class Meta:
        model = AvailableFilterSelectOptions
        fields = "__all__"


class FilterValuesSelectSerializer(serializers.ModelSerializer):
    class Meta:
        model = FilterValuesSelect
        fields = "__all__"


class FilterPropertiesSerializer(serializers.ModelSerializer):
    class Meta:
        model = FilterProperties
        fields = "__all__"


class FilterCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = FilterCategory
        fields = "__all__"


class PriceFilterCategorySerializers(serializers.ModelSerializer):
    class Meta:
        model = PriceFilterCategory
        fields = "__all__"


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = "__all__"


class SubCategorySerializers(serializers.ModelSerializer):
    class Meta:
        model = SubCategory
        fields = "__all__"


class UserInfoSerializers(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["id", "first_name", "last_name", "email"]


class AnswerSerializers(serializers.ModelSerializer):
    created_by = UserInfoSerializers(read_only=True)
    product_faq_id = serializers.IntegerField(write_only=True)

    class Meta:
        model = ProductFAQAnswer
        fields = ["id", "created_by", "created_at", "updated_at", "product_faq_id"]

    def create(self, validated_data):
        return ProductFAQ.objects.filter(
            id=validated_data.pop("product_faq_id")
        ).answer.objects.create(
            created_by=self.context["request"].user, **validated_data
        )


class ProductFAQSerializers(serializers.ModelSerializer):
    created_by = UserInfoSerializers(read_only=True)
    answer = AnswerSerializers(many=True)
    product_info_id = serializers.IntegerField(write_only=True)

    class Meta:
        model = ProductFAQ
        fields = [
            "id",
            "answer",
            "created_by",
            "created_at",
            "updated_at",
            "product_info_id",
        ]

    def create(self, validated_data):
        return ProductInfo.objects.get(
            id=validated_data.pop("product_info_id")
        ).faq.objects.create(created_by=self.context["request"].user, **validated_data)


class CommentOnReviewSerializers(serializers.ModelSerializer):
    created_by = UserInfoSerializers(read_only=True)
    product_review_id = serializers.IntegerField(write_only=True)

    class Meta:
        model = CommentOnReview
        fields = [
            "id",
            "comment",
            "created_by",
            "created_at",
            "updated_at",
            "product_review_id",
        ]

    def create(self, validated_data):
        return ProductReview.objects.get(
            id=validated_data.pop("product_review_id")
        ).comments.objects.create(
            reated_by=self.context["request"].user, **validated_data
        )


class ReportSerializers(serializers.ModelSerializer):
    created_by = UserInfoSerializers(read_only=True)
    product_review_id = serializers.IntegerField(write_only=True)

    class Meta:
        model = Report
        fields = [
            "id",
            "created_by",
            "description",
            "is_critical",
            "created_at",
            "updated_at",
            "product_review_id",
        ]

    def create(self, validated_data):
        return ProductReview.objects.get(
            id=validated_data.pop("product_review_id")
        ).report.create(created_by=self.context["request"].user, **validated_data)


class SellerInfoSerializer(serializers.ModelSerializer):
    user = UserInfoSerializers()

    class Meta:
        model = Seller
        fields = ["id", "user"]


class BrandListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = (
            "id",
            "name",
            "image",
        )


class CategoryListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = (
            "id",
            "name",
        )


class ProductInfoSerializers(serializers.ModelSerializer):
    seller = SellerInfoSerializer(read_only=True)

    class Meta:
        model = ProductInfo
        fields = "__all__"

    def create(self, validated_data):
        return ProductInfo.objects.create(
            seller=Seller.objects.get(user=self.context["request"].user),
            **validated_data
        )


class ProductListSerializers(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = [
            "id",
            "name",
            "stock",
            "original_price",
            "current_price",
            "created_at",
        ]


class ProductInfoListSerializers(serializers.ModelSerializer):
    category = CategoryListSerializer()
    brand = BrandListSerializer()
    seller = SellerInfoSerializer(read_only=True)
    product_set = ProductListSerializers(many=True, read_only=True)

    class Meta:
        model = ProductInfo
        fields = (
            "id",
            "name",
            "brand",
            "category",
            "seller",
            "product_set",
        )


class ProductSerializer(serializers.ModelSerializer):
    product_info = serializers.IntegerField(write_only=True)

    class Meta:
        model = Product
        fields = "__all__"

    def create(self, validated_data):
        return Product.objects.create(info=validated_data["product_info"])


class SellerProductsListSerializer(serializers.ModelSerializer):
    category = CategoryListSerializer()
    brand = BrandListSerializer()
    product_set = ProductListSerializers(many=True, read_only=True)
    stock = serializers.ReadOnlyField()
    is_available = serializers.BooleanField(read_only=True)

    class Meta:
        model = ProductInfo
        fields = (
            "id",
            "name",
            "category",
            "brand",
            "image",
            "created_at",
            "product_set",
            "stock",
            "is_available",
        )
        depth = 1


# serializers for public products display
class FAQAnswersDisplaySerializer(serializers.ModelSerializer):
    created_by = UserInfoSerializers(read_only=True)

    class Meta:
        model = ProductFAQAnswer
        fields = "__all__"


class FaqDisplaySerializer(serializers.ModelSerializer):
    created_by = UserInfoSerializers(read_only=True)
    answer = FAQAnswersDisplaySerializer(read_only=True, many=True)

    class Meta:
        model = ProductFAQ
        fields = "__all__"


class CommentOnReviewDisplaySerializer(serializers.ModelSerializer):
    created_by = UserInfoSerializers(read_only=True)

    class Meta:
        model = ProductFAQAnswer
        fields = "__all__"


class ProductReviewDisplaySerializer(serializers.ModelSerializer):
    comment = CommentOnReviewDisplaySerializer(read_only=True, many=True)
    created_by = UserInfoSerializers(read_only=True)

    class Meta:
        model = ProductReview
        fields = "__all__"


class FullProductInfoSerializer(serializers.ModelSerializer):
    category = CategoryListSerializer()
    brand = BrandListSerializer()
    seller = SellerInfoSerializer(read_only=True)
    faqs = FaqDisplaySerializer(read_only=True)
    review = ProductReviewDisplaySerializer(many=True, read_only=True)
    product_set = ProductSerializer(many=True, read_only=True)

    class Meta:
        model = ProductInfo
        fields = (
            "id",
            "name",
            "category",
            "brand",
            "image",
            "seller",
            "faqs",
            "review",
            "created_at",
            "product_set",
            "stock",
            "is_available",
        )


# display full product list with product + info(products, faqs, reviews etc)
class FullProductSerializer(serializers.ModelSerializer):
    info = FullProductInfoSerializer(read_only=True)

    class Meta:
        model = Product
        fields = "__all__"
        depth = 10
