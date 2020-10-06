from django.conf import settings
from secrets import compare_digest
from zxcvbn import zxcvbn


import base64
from datetime import datetime, timedelta
import json


from django.core.exceptions import ImproperlyConfigured
import jwt

user_model = settings.AUTH_USER_MODEL


def check_password_strength(password: str) -> bool:
    if len(password) < settings.MIN_PASSWORD_LENGTH:
        return False

    if compare_digest(password, ""):
        return False

    if int(zxcvbn(password)["guesses"]) < settings.PASSWORD_MIN_GUESSES:
        return False

    return True


def generate_payload(issuer, expires_in, **extra_data):

    now = datetime.utcnow()
    issued_at = now
    expiration = now + timedelta(seconds=expires_in)
    payload = {
        "iss": issuer,
        "exp": expiration,
        "iat": issued_at,
    }

    if extra_data:
        payload.update(**extra_data)

    return payload


def encode_jwt(payload, headers=None):

    # RS256 in default, because hardcoded legacy
    algorithm = getattr(settings, "JWT_ENC_ALGORITHM", "RS256")

    private_key_name = "JWT_PRIVATE_KEY_{}".format(payload["iss"].upper())
    private_key = getattr(settings, private_key_name, None)
    if not private_key:
        raise ImproperlyConfigured("Missing setting {}".format(private_key_name))
    encoded = jwt.encode(payload, private_key, algorithm=algorithm, headers=headers)
    return encoded.decode("utf-8")


def decode_jwt(jwt_value):

    try:
        headers_enc, payload_enc, verify_signature = jwt_value.split(".")
    except ValueError:
        raise jwt.InvalidTokenError()

    payload_enc += "=" * (-len(payload_enc) % 4)  # add padding
    payload = json.loads(base64.b64decode(payload_enc).decode("utf-8"))

    algorithms = getattr(settings, "JWT_JWS_ALGORITHMS", ["HS256", "RS256"])
    public_key_name = "JWT_PUBLIC_KEY_{}".format(payload["iss"].upper())
    public_key = getattr(settings, public_key_name, None)
    if not public_key:
        raise ImproperlyConfigured("Missing setting {}".format(public_key_name))

    decoded = jwt.decode(jwt_value, public_key, algorithms=algorithms)
    return decoded
