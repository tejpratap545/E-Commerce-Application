from .manager import UserManager
from django.conf import settings
from django.contrib.auth.models import _user_has_module_perms as user_has_module_perms
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.db import models
from django.utils.translation import ugettext_lazy as _
from oauth2_provider.models import AbstractAccessToken, AbstractRefreshToken
from oauth2_provider.settings import oauth2_settings
from typing import Optional


class AbstractAddress(models.Model):
    city = models.CharField(max_length=50, blank=False, null=False)
    state = models.CharField(max_length=50, blank=False, null=False)
    country = models.CharField(max_length=50, blank=False, null=False)
    postal_code = models.CharField(max_length=10, blank=False, null=False)
    contact_number = models.CharField(max_length=20, blank=False, null=False)
    email = models.EmailField(max_length=30, blank=True, null=True)

    class Meta:
        abstract = True


#
# class ShippingAddress(AbstractAddress):
#     room = models.IntegerField(_("Room Number"), blank=True, null=True)
#     address1 = models.CharField(
#         _("Address first"), max_length=300, blank=False, null=False
#     )
#     address2 = models.CharField(max_length=300, blank=True, null=True)
#
#     def __str__(self):
#         return self.postal_code
#
#
# class BillingAddress(AbstractAddress):
#     pass


class PasswordTooWeakError(Exception):
    pass


class User(AbstractBaseUser, PermissionsMixin):
    id = models.BigAutoField(primary_key=True, auto_created=True, unique=True)

    email = models.EmailField(
        _("Email Address"), max_length=30, blank=False, null=False, unique=True
    )
    contact_number = models.CharField(
        _("Contact Number"), max_length=15, blank=False, null=False, unique=True
    )
    first_name = models.CharField(_("First Name"), max_length=50, blank=True, null=True)
    last_name = models.CharField(_("Last Name"), max_length=50, blank=True, null=True)
    date_of_birth = models.DateField(null=True)
    avatar = models.ImageField(upload_to="user/avatar")

    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)

    is_email_verified = models.BooleanField(default=False)

    @property
    def is_staff(self):
        return self.is_admin

    is_customer = models.BooleanField(default=False)
    is_seller = models.BooleanField(default=False)

    date_joined = models.DateTimeField(auto_now_add=True)

    objects = UserManager()
    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["contact_number"]

    def __str__(self):
        return self.email

    def set_password(self, password: Optional[str]) -> None:
        """
        set the password of user
        if password is none then set it to unusable otherwise first check the password strength and the set
        """
        if password is None:
            self.set_unusable_password()
            return

        from backend.utils.backend import check_password_strength

        if not check_password_strength(password):
            raise PasswordTooWeakError

        super().set_password(password)


class FakeAccessToken(models.Model):
    pass


class RefreshToken(AbstractRefreshToken):
    token = models.TextField()
    application = models.ForeignKey(
        oauth2_settings.APPLICATION_MODEL,
        on_delete=models.CASCADE,
        related_name="oauth2_application_api_refresh_tokes",
    )
    access_token = models.OneToOneField(
        settings.OAUTH2_PROVIDER_ACCESS_TOKEN_MODEL,
        on_delete=models.SET_NULL,
        blank=True,
        null=True,
        related_name="refresh_token_apis",
    )


class AccessToken(AbstractAccessToken):
    token = models.TextField()
    application = models.ForeignKey(
        oauth2_settings.APPLICATION_MODEL,
        on_delete=models.CASCADE,
        related_name="oauth2_application_api_access_tokes",
    )
    source_refresh_token = models.OneToOneField(
        RefreshToken,
        on_delete=models.SET_NULL,
        blank=True,
        null=True,
        related_name="access_token_apis",
    )


# class Customer(models.Model):
#     user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
#     shipping_address = models.ManyToManyField(ShippingAddress)
#     billing_address = models.ManyToManyField(BillingAddress)
