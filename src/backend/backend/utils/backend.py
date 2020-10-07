from datetime import datetime, timedelta
from django.conf import settings
from django.core.exceptions import ImproperlyConfigured
from secrets import compare_digest
from zxcvbn import zxcvbn

import base64
import json
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


def generate_payload(
    issuer, expires_in, token, token_type, token_provider, **extra_data
):

    now = datetime.utcnow()
    issued_at = now
    expiration = now + timedelta(seconds=expires_in)
    payload = {
        "iss": issuer,
        "exp": expiration,
        "iat": issued_at,
        "token_type": token_type,
        "token": token,
        "token_provider": token_provider,
    }

    if extra_data:
        payload.update(**extra_data)

    return payload


def encode_token(token, token_type, token_expiry, token_provider):
    algorithm = "RS256"

    private_key = settings.JWT_PRIVATE_KEY_ONEISSUER
    if not private_key:
        raise ImproperlyConfigured("Missing setting private key")
    payload = generate_payload(
        settings.JWT_ISSUER, token_expiry, token, token_type, token_provider
    )
    encoded = jwt.encode(payload, private_key, algorithm=algorithm)
    return encoded


def decode_jwt(jwt_value):

    try:
        headers_enc, payload_enc, verify_signature = jwt_value.split(".")
    except ValueError:
        raise jwt.InvalidTokenError()

    payload_enc += "=" * (-len(payload_enc) % 4)  # add padding
    payload = json.loads(base64.b64decode(payload_enc).decode("utf-8"))

    algorithms = "RS256"

    public_key = settings.JWT_PUBLIC_KEY_ONEISSUER
    if not public_key:
        raise ImproperlyConfigured("Missing setting  pubic key")

    decoded = jwt.decode(jwt_value, public_key, algorithms=algorithms)
    return decoded['token']
