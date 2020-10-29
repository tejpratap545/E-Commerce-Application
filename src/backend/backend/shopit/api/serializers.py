from backend.shopit.models import *
from backend.users.models import User
from rest_framework import serializers


# basic serializers for general  CRUD operations
# ------------------------------------------------------------------------------
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


class PriceFilterCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = PriceFilterCategory
        fields = "__all__"


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = "__all__"


class SubCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = SubCategory
        fields = "__all__"


class UserInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["id", "first_name", "last_name", "email"]


class ProductFAQAnswerSerializer(serializers.ModelSerializer):
    """
    serialize product_info faq's questions answer with basic information about the user based on UserInfoSerializers
    """

    created_by = UserInfoSerializer(read_only=True)
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


class ProductFAQSerializer(serializers.ModelSerializer):
    """
    serialize product_info faq with basic information about the user based on UserInfoSerializers and all answers
    based on ProductFAQAnswerSerializers
    """

    answers = ProductFAQAnswerSerializer(many=True)
    created_by = UserInfoSerializer(read_only=True)
    product_info_id = serializers.IntegerField(write_only=True)

    class Meta:
        model = ProductFAQ
        fields = [
            "id",
            "answers",
            "created_by",
            "created_at",
            "updated_at",
            "product_info_id",
        ]

    def create(self, validated_data):
        return ProductInfo.objects.get(
            id=validated_data.pop("product_info_id")
        ).faq.objects.create(created_by=self.context["request"].user, **validated_data)


class CommentOnReviewSerializer(serializers.ModelSerializer):
    """
    serialize customers comments on other customer reviews  with basic information about the user based on
    UserInfoSerializers
    """

    product_review_id = serializers.IntegerField(write_only=True)
    created_by = UserInfoSerializer(read_only=True)

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


class ProductReviewSerializer(serializers.ModelSerializer):
    comments = CommentOnReviewSerializer(read_only=True, many=True)
    created_by = UserInfoSerializer(read_only=True)

    class Meta:
        model = ProductReview
        fields = "__all__"


class ReportSerializer(serializers.ModelSerializer):
    created_by = UserInfoSerializer(read_only=True)
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


# -------------------------------------------------------------------------------------------------------------------
# some shortcuts serializers for display basic information about the fields


class SellerInfoSerializer(serializers.ModelSerializer):
    """
    display seller information id and user info (id, name,email)
    """

    user = UserInfoSerializer()

    class Meta:
        model = Seller
        fields = ["id", "user"]


class BrandListSerializer(serializers.ModelSerializer):
    """
    serialize brand with id , name, and image
    """

    class Meta:
        model = Brand
        fields = (
            "id",
            "name",
            "image",
        )


class CategoryListSerializer(serializers.ModelSerializer):
    """
    serialize category with id , name , image
    """

    class Meta:
        model = Category
        fields = (
            "id",
            "name",
            "image",
        )


class ProductInfoSerializer(serializers.ModelSerializer):
    seller = SellerInfoSerializer(read_only=True)

    class Meta:
        model = ProductInfo
        fields = "__all__"

    def create(self, validated_data):
        return ProductInfo.objects.create(
            seller=Seller.objects.get(user=self.context["request"].user),
            **validated_data
        )


class ProductListSerializer(serializers.ModelSerializer):
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


class ProductInfoListSerializer(serializers.ModelSerializer):
    category = CategoryListSerializer()
    brand = BrandListSerializer()
    seller = SellerInfoSerializer(read_only=True)
    product_set = ProductListSerializer(many=True, read_only=True)
    rating1 = serializers.IntegerField()
    rating2 = serializers.IntegerField()
    rating3 = serializers.IntegerField()
    rating4 = serializers.IntegerField()
    rating5 = serializers.IntegerField()
    rating_avg = serializers.IntegerField()

    class Meta:
        model = ProductInfo
        fields = (
            "id",
            "name",
            "brand",
            "category",
            "seller",
            "product_set",
            "rating1",
            "rating2",
            "rating3",
            "rating4",
            "rating5",
            "rating_avg",
        )


class ProductSerializer(serializers.ModelSerializer):
    product_info = serializers.IntegerField(write_only=True)

    class Meta:
        model = Product
        fields = "__all__"

    def create(self, validated_data):
        return Product.objects.create(info=validated_data["product_info"])


class SellerProductsListSerializer(serializers.ModelSerializer):
    """
    serialize seller products based on the the current active seller in this products list date serialize based on
    the basic information about the category , based  , stock , and is_available in each product information also
    contain the product_set which  is reverse relationship of product_info
    """

    category = CategoryListSerializer()
    brand = BrandListSerializer()
    product_set = ProductListSerializer(many=True, read_only=True)
    stock = serializers.ReadOnlyField()
    is_available = serializers.BooleanField(read_only=True)
    rating1 = serializers.IntegerField()
    rating2 = serializers.IntegerField()
    rating3 = serializers.IntegerField()
    rating4 = serializers.IntegerField()
    rating5 = serializers.IntegerField()
    rating_avg = serializers.IntegerField()

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
            "rating1",
            "rating2",
            "rating3",
            "rating4",
            "rating5",
            "rating_avg",
        )
        depth = 1


class FullProductInfoSerializer(serializers.ModelSerializer):
    category = CategoryListSerializer()
    brand = BrandListSerializer()
    seller = SellerInfoSerializer(read_only=True)
    faqs = ProductFAQSerializer(many=True, read_only=True)
    reviews = ProductReviewSerializer(many=True, read_only=True)
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
            "reviews",
            "created_at",
            "product_set",
            "stock",
            "is_available",
        )


# display full product list with product + info(other purchaseOptions products, faqs, reviews etc)
class FullProductSerializer(serializers.ModelSerializer):
    info = FullProductInfoSerializer(read_only=True)
    rating1 = serializers.IntegerField()
    rating2 = serializers.IntegerField()
    rating3 = serializers.IntegerField()
    rating4 = serializers.IntegerField()
    rating5 = serializers.IntegerField()
    rating_avg = serializers.IntegerField()

    class Meta:
        model = Product
        fields = "__all__"
