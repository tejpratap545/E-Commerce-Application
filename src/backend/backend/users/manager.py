from django.contrib.auth.models import BaseUserManager


class UserManager(BaseUserManager):
    def create_user(self, email, contact_number, password=None, *args, **kwargs):
        """Create the user by the email , contact number and password  and save into the database """
        if not email:
            raise ValueError("Users must have an email address")
        if not contact_number:
            raise ValueError("Users must have a contact Number")

        user = self.model(
            email=self.normalize_email(email),
            contact_number=contact_number,
            *args,
            **kwargs
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, contact_number, password=None, *args, **kwargs):
        user = self.create_user(email, contact_number, password, *args, **kwargs)
        user.is_admin = True
        user.is_superuser = True
        user.save(using=self._db)
        return user

    def create_admin_user(self, email, contact_number, password=None, *args, **kwargs):
        user = self.create_user(email, contact_number, password, *args, **kwargs)
        user.is_admin = True
        user.save(using=self._db)
        return user

    def create_customer_user(
        self, email, contact_number, password=None, *args, **kwargs
    ):
        user = self.create_user(email, contact_number, password, *args, **kwargs)
        user.is_customer = True
        user.save(using=self._db)
        return user

    def create_seller_user(self, email, contact_number, password=None, *args, **kwargs):
        user = self.create_user(email, contact_number, password, *args, **kwargs)
        user.is_seller = True
        user.save(using=self._db)
        return user
