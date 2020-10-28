from backend.shopit.api.views import SellerProductsViewSet
from backend.users.views import TokenView
from django.urls import re_path
from django.urls.conf import include, path


from backend.users.api.views import (  # SignUpUserView,; UserView,
    check_contact_number,
    check_email,
    PasswordChangeView,
    ProfileView,
    SignUpUserView,
    UserUpdateView,
    PasswordResetSend,
    PasswordChangeDone,
    PasswordResetConfirm,
    confirmation_email_send,
    confirmation_email_verify,
)

urlpatterns = [
    # main auth urls
    path("auth/token/", TokenView.as_view(), name="generate_jwt_token"),
    path("auth/", include("rest_framework_social_oauth2.urls")),
    path(
        "auth/changepassword",
        PasswordChangeView.as_view(),
        name="change password of user ",
    ),
    # user view
    path("user/signup/", SignUpUserView.as_view(), name="user_sign_up "),
    path("user/update/", UserUpdateView.as_view(), name="user_update"),
    path("user/me/", ProfileView.as_view()),
    # check contact_number and email_availability
    path("check/email/", check_email, name="check_email_availability"),
    path(
        "check/contactnumber/",
        check_contact_number,
        name="check_contact_number_availability",
    ),
    # password reset
    path(
        "password/reset/send/", PasswordResetSend.as_view(), name="password_reset_start"
    ),  # this url is for resend verification link
    path(
        "password/reset/confirm/",
        PasswordResetConfirm.as_view(),
        name="password_reset_confirm",
    ),
    path(
        "password/reset/done/", PasswordChangeDone.as_view(), name="password_reset_done"
    ),
    # email verification
    path(
        "confirmation/email/send/",
        confirmation_email_send,
        name="email_confirm_send",
    ),
    path(
        "confirmation/email/confirm/",
        confirmation_email_verify,
        name="email_confirm_check",
    ),
    # products
    # path("seller/product/", SellerProducts.as_view(), name="get the seller products"),
]
