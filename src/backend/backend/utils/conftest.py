from backend.users.models import User
from backend.users.tests.factories import ApplicationFactory, UserFactory
from oauth2_provider.models import Application


def user() -> User:
    return UserFactory()


def application() -> Application:
    return ApplicationFactory()
