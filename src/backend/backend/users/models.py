from .manager import UserManager
from django.contrib.auth.models import _user_has_module_perms as user_has_module_perms
from django.contrib.auth.models import AbstractUser, PermissionsMixin
from django.db import models
from django.utils.translation import ugettext_lazy as _
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


class ShippingAddress(AbstractAddress):
    room = models.IntegerField(_("Room Number"), blank=True, null=True)
    address1 = models.CharField(
        _("Address first"), max_length=300, blank=False, null=False
    )
    address2 = models.CharField(max_length=300, blank=True, null=True)

    def __str__(self):
        return self.postal_code


class BillingAddress(AbstractAddress):
    pass


# Create your models here.
class PasswordTooWeakError(Exception):
    pass


class User(AbstractUser):

    email = models.EmailField(
        _("Email Address"), max_length=30, blank=False, null=False, unique=True
    )
    contact_number = models.CharField(
        _("Contact Number"), max_length=15, blank=False, null=False, unique=True
    )
    first_name = models.CharField(_("First Name"), max_length=50, blank=True, null=True)
    last_name = models.CharField(_("Last Name"), max_length=50, blank=True, null=True)
    date_of_birth = models.DateField()

    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)

    @property
    def is_staff(self):
        return self.is_admin

    is_customer = models.BooleanField(default=False)
    is_seller = models.BooleanField(default=False)

    date_joined = models.DateTimeField(auto_now_add=True)

    objects = UserManager()
    USERNAME_FIELD = email
    REQUIRED_FIELDS = ["contact_number"]

    def __str__(self):
        return self.email

    def has_perms(self, perm_list, obj=None) -> bool:
        """
        Return True if the user has each of the specified permissions. If
        object is passed, check if the user has all required perms for it.
        """
        return all(self.has_perm(perm, obj) for perm in perm_list)

    def has_module_perms(self, app_label) -> bool:
        """
        Return True if the user has any permissions in the given app label.
        Use similar logic as has_perm(), above.
        """
        # Active superusers have all permissions.
        if self.is_active and self.is_superuser:
            return True

        return user_has_module_perms(self, app_label)

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
