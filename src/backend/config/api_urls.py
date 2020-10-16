from backend.users.api.views import (
    check_contact_number,
    check_email,
    PasswordChangeView,
    ProfileView,
    SignUpUserView,
    UserView,
)
from backend.users.views import TokenView
from django.urls.conf import include, path


urlpatterns = [
    path("auth/token", TokenView.as_view(), name="generate jwt token"),
    path("auth/", include("rest_framework_social_oauth2.urls")),
    path("user/signup", SignUpUserView.as_view(), name="user sign up "),
    path("user/<int:id>", UserView.as_view()),
    path("user/me/", ProfileView.as_view()),
    path("check/email", check_email, name="check email validity"),
    path(
        "check/contactnumber",
        check_contact_number,
        name="check contact number  validity",
    ),
    path(
        "auth/changepassword",
        PasswordChangeView.as_view(),
        name="change password of user ",
    ),
]
