from django.conf import settings
from secrets import compare_digest
from zxcvbn import zxcvbn


user_model = settings.AUTH_USER_MODEL


def check_password_strength(password: str) -> bool:
    if len(password) < settings.MIN_PASSWORD_LENGTH:
        return False

    if compare_digest(password, ""):
        return False

    if int(zxcvbn(password)["guesses"]) < settings.PASSWORD_MIN_GUESSES:
        return False

    return True
