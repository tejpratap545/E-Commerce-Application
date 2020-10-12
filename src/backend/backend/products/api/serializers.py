from backend.products.models import Brand
from rest_framework.serializers import ModelSerializer


class BrandSerializer(ModelSerializer):

    class Meta:
        model = Brand
        fields = "__all__"
