from backend.shopit.models import *
from backend.users.models import User
from rest_framework import serializers


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
        ).comments.objects.create(**validated_data)


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
        fields = ["user"]


class BrandListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = (
            "name",
            "image",
        )


class CategoryListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ("name",)


class ProductInfoSerializers(serializers.ModelSerializer):
    category = CategoryListSerializer()
    brand = BrandListSerializer()
    seller = SellerInfoSerializer(read_only=True)

    class Meta:
        model = ProductInfo
        fields = "__all__"

    def create(self, validated_data):
        return ProductInfo.objects.create(
            seller=Seller.objects.filter(user=self.context["request"].user),
            **validated_data
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

    class Meta:
        model = ProductInfo
        fields = (
            "id",
            "name",
            "category",
            "brand",
            "image",
            "stoke",
            "is_available",
            "created_at",
        )
        depth = 1
