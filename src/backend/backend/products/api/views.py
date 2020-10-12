from .serializers import BrandSerializer
from backend.products.models import Brand
from rest_framework import viewsets


class BrandViewSet(viewsets.ModelViewSet):

    queryset = Brand.objects.all()
    serializer_class = BrandSerializer
