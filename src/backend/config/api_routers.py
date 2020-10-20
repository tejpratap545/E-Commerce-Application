from backend.products.api.views import BrandViewSet
from backend.users.api.views import BillingAddressViewSet, ShippingAddressViewSet
from django.conf import settings
from rest_framework.routers import DefaultRouter, SimpleRouter


if settings.DEBUG:
    router = DefaultRouter()
else:
    router = SimpleRouter()

router.register("brand", BrandViewSet)
router.register("address/billing", BillingAddressViewSet)
router.register("address/shipping", ShippingAddressViewSet)
# router.register("user/me", UserViewSet)


app_name = "api"
urlpatterns = router.urls
