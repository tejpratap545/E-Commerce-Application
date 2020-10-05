from django.contrib.auth.models import BaseUserManager


class UserManager(BaseUserManager):
    def create_user(
        self,
        email,
        contact_number,
        password=None,
    ):
        """Create the user by the email , contact number and password  and save into the database """
        if not email:
            raise ValueError("Users must have an email address")
        if not contact_number:
            raise ValueError("Users must have a contact Number")

        user = self.create_user(email=email, contact_number=contact_number)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, contact_number, password=None):
        user = self.create_user(email, contact_number, password)
        user.is_admin = True
        user.save(using=self._db)
        return user

    def create_customer_user(self, email, contact_number, password=None):
        user = self.create_user(email, contact_number, password)
        user.is_customer = True
        user.save(using=self._db)
        return user

    def create_seller_user(self, email, contact_number, password=None):
        user = self.create_user(email, contact_number, password)
        user.is_customer = True
        user.save(using=self._db)
        return user
