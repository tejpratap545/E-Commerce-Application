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

# Register your models here.
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.db.models import JSONField
from django_better_admin_arrayfield.admin.mixins import DynamicArrayMixin
from django_better_admin_arrayfield.forms.fields import DynamicArrayField
from django_better_admin_arrayfield.forms.widgets import DynamicArrayTextareaWidget
from jsoneditor.forms import JSONEditor


class UserAdmin(BaseUserAdmin):
    form = UserAdminChangeForm
    add_form = UserAdminCreationForm

    # The fields to be used in displaying the User model.
    # These override the definitions on the base UserAdmin
    # that reference specific fields on auth.User.
    list_display = ("email", "is_admin", "is_active", "is_seller", "is_customer")
    list_filter = ("is_admin", "is_active", "is_seller", "is_customer")
    fieldsets = (
        (None, {"fields": ("email", "contact_number", "password")}),
        (
            "Personal info",
            {"fields": ("first_name", "last_name", "date_of_birth", "avatar")},
        ),
        (
            "Permissions",
            {"fields": ("is_admin", "is_seller", "is_customer", "is_active")},
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
    ordering = ("email",)
    filter_horizontal = ()


admin.site.register(User, UserAdmin)
admin.site.register(Profile)


class CustomAdmin(admin.ModelAdmin, DynamicArrayMixin):
    formfield_overrides = {
        JSONField: {"widget": JSONEditor},
    }


@admin.register(Seller)
class SellerAdmin(CustomAdmin):
    pass


admin.site.register(BillingAddress)
admin.site.register(ShippingAddress)
admin.site.register(EmailConfirmation)
admin.site.register(PasswordReset)
