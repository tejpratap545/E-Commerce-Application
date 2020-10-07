from backend.users.models import User
from factory import post_generation
from factory.django import DjangoModelFactory
from faker import Faker
from oauth2_provider.models import Application
from typing import Any, Sequence

import factory


fake = Faker()


class UserFactory(DjangoModelFactory):
    class Meta:
        model = User
        django_get_or_create = ["email"]

    contact_number = fake.phone_number()
    email = fake.email()
    first_name = fake.first_name()
    last_name = fake.last_name()
    date_of_birth = fake.date_of_birth()

    @post_generation
    def password(self, create: bool, extracted: Sequence[Any], **kwargs):
        password = "dummypassword123"
        self.set_password(password)


class AdminUserFactory(UserFactory):
    is_admin = True


class SuperUserFactory(DjangoModelFactory):
    class Meta:
        model = User
        django_get_or_create = ["email"]

    contact_number = fake.phone_number()
    email = fake.email()
    first_name = fake.first_name()
    last_name = fake.last_name()
    date_of_birth = fake.date_of_birth()

    is_superuser = True

    @post_generation
    def password(self, create: bool, extracted: Sequence[Any], **kwargs):
        password = "dummypassword123"
        self.set_password(password)


class SellerUserFactory(UserFactory):
    is_seller = True


class ApplicationFactory(DjangoModelFactory):
    class Meta:
        model = Application
        django_get_or_create = ["name"]

    name = fake.name()

    authorization_grant_type = "password"
    client_type = "confidential"
    user = factory.SubFactory(SuperUserFactory)
