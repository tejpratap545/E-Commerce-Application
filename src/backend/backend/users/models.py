from .manager import UserManager
from backend.utils.fileds import CardExpiryField, CardNumberField, SecurityCodeField
from django.conf import settings
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.db import models
from django_countries.fields import CountryField
from phonenumber_field.modelfields import PhoneNumberField
from typing import Optional

import secrets
import uuid as uuid


class AbstractAddress(models.Model):
    room = models.IntegerField(blank=True, null=True)
    address1 = models.TextField(blank=False, null=False)
    address2 = models.TextField(blank=True, null=True)
    city = models.CharField(max_length=50, blank=False, null=False)
    state = models.CharField(max_length=50, blank=False, null=False)
    country = CountryField(max_length=50, blank=False, null=False)
    postal_code = models.CharField(max_length=10, blank=False, null=False)
    contact_number = PhoneNumberField(blank=False, null=False)
    fax = models.CharField(max_length=30, blank=True, null=True)
    email = models.EmailField(max_length=30, blank=True, null=True)

    class Meta:
        abstract = True


class ShippingAddress(AbstractAddress):
    extra_information = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.postal_code


class BillingAddress(AbstractAddress):

    card_number = CardNumberField()
    card_expiry = CardExpiryField()
    security_field = SecurityCodeField()

    def __str__(self):
        return self.card_number


class PasswordTooWeakError(Exception):
    pass


class User(AbstractBaseUser, PermissionsMixin):
    id = models.BigAutoField(primary_key=True, auto_created=True, unique=True)

    email = models.EmailField(max_length=30, blank=False, null=False, unique=True)
    contact_number = PhoneNumberField(blank=True, null=True)
    first_name = models.CharField(max_length=50, blank=True, null=True)
    last_name = models.CharField(max_length=50, blank=True, null=True)
    date_of_birth = models.DateField(null=True)
    avatar = models.ImageField(upload_to="user/avatar", blank=True, null=True)

    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)

    is_email_verified = models.BooleanField(default=False)
    md5_hash = models.CharField(max_length=100, blank=True, null=True)

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


class Profile(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    default_shipping_address = models.PositiveSmallIntegerField(default=0)
    default_purchasing_address = models.PositiveSmallIntegerField(default=0)
    shipping_address = models.ManyToManyField(ShippingAddress)
    billing_address = models.ManyToManyField(BillingAddress)

    def __str__(self):
        return self.user.email


class EmailConfirmation(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    token = models.CharField(
        max_length=250, default=secrets.token_urlsafe(), editable=False
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.user.email


class PasswordReset(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    url_token = models.CharField(
        max_length=250, default=secrets.token_urlsafe(), editable=False
    )
    success_token = models.CharField(
        max_length=250, blank=True, null=True, editable=False
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.user.email
