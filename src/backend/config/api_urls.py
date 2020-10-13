from backend.users.views import check_contact_number, check_email, SignUpUserView, TokenView, UserView
from django.urls.conf import include, path


urlpatterns = [
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
]
