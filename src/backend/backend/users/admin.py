from .forms import UserAdminChangeForm, UserAdminCreationForm
from .models import User

# Register your models here.
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin


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
