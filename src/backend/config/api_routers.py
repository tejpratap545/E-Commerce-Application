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
router.register("subcategory/filter/value", FilterValuesViewSet)
router.register("subcategory/filter/properties", FilterPropertiesViewSet)
router.register("pricefilter", PriceFilterViewSet)
router.register("middlepricerange", MiddlePriceRangeViewSet)
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
