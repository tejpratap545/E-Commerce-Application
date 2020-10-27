from backend.shopit.api.views import *
from backend.users.api.views import BillingAddressViewSet, ShippingAddressViewSet
from django.conf import settings
from rest_framework.routers import DefaultRouter, SimpleRouter


if settings.DEBUG:
    router = DefaultRouter()
else:
    router = SimpleRouter()


router.register("address/billing", BillingAddressViewSet)
router.register("address/shipping", ShippingAddressViewSet)

router.register("brand", BrandViewSet)

router.register("category", CategoryViewSet)
router.register("subcategory", SubCategoryViewSet)
router.register("subcategory/filter", FilterCategoryViewSet)
router.register("subcategory/properties", FilterPropertiesViewSet)

# show filters for design a product based on various select options aor may be text options
router.register("filter/text", FilterValuesTextViewSet)
router.register("filter/select", FilterValuesSelectViewSet)
router.register("filter/select/options", AvailableFilterSelectOptionsViewSet)
router.register("filter/price", PriceFilterViewSet)
# router.register("user/me", UserViewSet)


# product
router.register("product/info", ProductInfoViewSet)
router.register("product", ProductViewSet)


# reports , comments ,FAQ on product

router.register("product/faq", ProductFAQViewSet)
router.register("product/faq/answer", AnswerViewSet)
router.register("product/review", ReportViewSet)
router.register("product/review/comments", CommentOnReviewViewSet)


app_name = "shopit"
urlpatterns = router.urls
