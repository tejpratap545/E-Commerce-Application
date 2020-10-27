from .forms import UserAdminChangeForm, UserAdminCreationForm
from .models import (
    BillingAddress,
    EmailConfirmation,
    PasswordReset,
    Profile,
    Seller,
    ShippingAddress,
    User,
)

from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.core.paginator import Paginator
from django.db import connection, transaction
from django.db.models import JSONField
from django.db.utils import OperationalError
from django.utils.functional import cached_property
from django_better_admin_arrayfield.admin.mixins import DynamicArrayMixin
from jsoneditor.forms import JSONEditor


class TimeLimitedPaginator(Paginator):
    """
    Paginator that enforces a timeout on the count operation.
    If the operations times out, a fake bogus value is
    returned instead.
    """

    @cached_property
    def count(self):
        # We set the timeout in a db transaction to prevent it from
        # affecting other transactions.
        with transaction.atomic(), connection.cursor() as cursor:
            cursor.execute("SET LOCAL statement_timeout TO 200;")
            try:
                return super().count
            except OperationalError:
                return 9999999999


@admin.register(User)
class UserAdmin(BaseUserAdmin):
    form = UserAdminChangeForm
    add_form = UserAdminCreationForm

    # The fields to be used in displaying the User model.
    # These override the definitions on the base UserAdmin
    # that reference specific fields on auth.User.
    list_display = (
        "email",
        "contact_number",
        "is_admin",
        "is_active",
        "is_seller",
        "is_customer",
        "is_email_verified",
        "date_joined",
    )
    list_filter = (
        "is_admin",
        "is_active",
        "is_seller",
        "is_customer",
        "is_email_verified",
    )
    fieldsets = (
        (None, {"fields": ("email", "contact_number", "password")}),
        (
            "Personal info",
            {"fields": ("first_name", "last_name", "date_of_birth", "avatar")},
        ),
        (
            "Permissions",
            {
                "fields": (
                    "is_admin",
                    "is_seller",
                    "is_customer",
                    "is_active",
                    "is_email_verified",
                )
            },
        ),
    )
    # add_fieldsets is not a standard ModelAdmin attribute. UserAdmin
    # overrides get_fieldsets to use this attribute when creating a user.
    add_fieldsets = (
        (
            None,
            {
                "classes": ("wide",),
                "fields": (
                    "email",
                    "contact_number",
                    "password1",
                    "password2",
                    "is_admin",
                    "is_seller",
                    "is_customer",
                ),
            },
        ),
    )
    search_fields = ("email", "contact_number")
    ordering = ("email", "date_joined")
    filter_horizontal = ()


class CustomAdmin(admin.ModelAdmin, DynamicArrayMixin):
    formfield_overrides = {
        JSONField: {"widget": JSONEditor},
    }


@admin.register(Seller)
class SellerAdmin(CustomAdmin):
    paginator = TimeLimitedPaginator
    list_display = ("user",)
    filter_horizontal = ("billing_address",)


@admin.register(Profile)
class ProfileAdmin(CustomAdmin):
    paginator = TimeLimitedPaginator
    list_display = ("user",)
    filter_horizontal = ("shipping_address", "billing_address")


@admin.register(BillingAddress)
class BillingAddressAdmin(CustomAdmin):
    list_display = (
        "email",
        "contact_number",
        "card_number",
        "country",
    )
    list_filter = (
        "city",
        "country",
    )
    search_fields = ("email", "contact_number", "city", "country", "card_number")
    ordering = ("country", "city")


@admin.register(ShippingAddress)
class ShippingAddressAdmin(CustomAdmin):
    list_display = ("email", "contact_number", "city", "country", "postal_code")
    list_filter = ("city", "country", "postal_code")
    search_fields = ("email", "contact_number", "city", "country", "postal_code")
    ordering = ("country", "city")


@admin.register(EmailConfirmation)
class EmailConfirmationAdmin(CustomAdmin):
    pass


@admin.register(PasswordReset)
class PasswordResetAdmin(CustomAdmin):
    pass
