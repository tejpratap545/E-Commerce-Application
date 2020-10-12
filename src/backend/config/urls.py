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
from backend.users.views import (
    check_contact_number,
    check_email,
    SignUpUserView,
    TokenView,
    UserView,
)
from django.conf import settings
from django.conf.urls import include, url
from django.contrib import admin
from django.urls import path
from drf_yasg import openapi
from drf_yasg.views import get_schema_view
from rest_framework import permissions


urlpatterns = [
    path("admin/", admin.site.urls),
]


schema_view = get_schema_view(
    openapi.Info(
        title="The E-Commerce-Web-Application API",
        default_version="v1",
        description="Test description",
        terms_of_service="https://www.google.com/policies/terms/",
        contact=openapi.Contact(email="Tejpratapsingh545@outlook.com"),
        license=openapi.License(name="BSD License"),
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
)

urlpatterns += [
    path(
        "swagger(?P<format>\.json|\.yaml)$",
        schema_view.without_ui(cache_timeout=0),
        name="schema-json",
    ),
    path(
        "swagger/",
        schema_view.with_ui("swagger", cache_timeout=0),
        name="schema-swagger-ui",
    ),
    path("", schema_view.with_ui("redoc", cache_timeout=0), name="schema-redoc"),
]


# users authentication

urlpatterns += [
    # authentication and token generators views
    path("auth/token", TokenView.as_view(), name="generate jwt token"),
    path("auth/", include("rest_framework_social_oauth2.urls")),
    path("user/signup", SignUpUserView.as_view(), name="user sign up "),
    path("user/<int:id>", UserView.as_view()),
    path("check/email", check_email, name="check email validity"),
    path(
        "check/contactnumber",
        check_contact_number,
        name="check contact number  validity",
    ),
    path("api/", include("config.api_routers")),
]
if settings.DEBUG:
    import debug_toolbar

    urlpatterns += [
        path("__debug__/", include(debug_toolbar.urls)),
    ]


from rest_framework.schemas import get_schema_view as drf_shema


urlpatterns += [
    # ...
    # Use the `get_schema_view()` helper to add a `SchemaView` to project URLs.
    #   * `title` and `description` parameters are passed to `SchemaGenerator`.
    #   * Provide view name for use with `reverse()`.
    path(
        "openapi",
        drf_shema(
            title="Your Project", description="API for all things …", version="1.0.0"
        ),
        name="openapi-schema",
    ),
]
