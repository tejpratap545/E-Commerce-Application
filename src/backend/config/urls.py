"""backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.conf import settings
from django.conf.urls import include
from django.contrib import admin
from django.http import HttpResponse
from django.urls import path
from drf_spectacular.views import SpectacularAPIView, SpectacularRedocView, SpectacularSwaggerView
from rest_framework.schemas import get_schema_view as drf_shema


urlpatterns = [
    path("admin/", admin.site.urls),
]


urlpatterns += [
    path(
        "",
        SpectacularRedocView.as_view(url_name="schema"),
        name="redoc",
    ),
    path("api/schema/", SpectacularAPIView.as_view(), name="schema"),
    # Optional UI:
    path(
        "swagger-ui/",
        SpectacularSwaggerView.as_view(url_name="schema"),
        name="swagger-ui",
    ),
]


# users authentication
from django.contrib.staticfiles.storage import staticfiles_storage
from django.views.generic.base import RedirectView


def version(request):
    return HttpResponse("v1")


urlpatterns += [
    # authentication and token generators views
    path("api/", include("config.api_routers")),
    path("api/", include("config.api_urls")),
    path(
        "favicon.ico", RedirectView.as_view(url=staticfiles_storage.url("shopit.png"))
    ),
    path("api/api/v1/version", version),
]
if settings.DEBUG:
    import debug_toolbar

    urlpatterns += [
        path("__debug__/", include(debug_toolbar.urls)),
    ]
