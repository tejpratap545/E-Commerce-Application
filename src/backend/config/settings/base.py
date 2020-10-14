"""
Base settings to build other settings files upon.
"""

from decimal import ROUND_HALF_EVEN
from moneyed.localization import _FORMATTER
from pathlib import Path

import environ
import moneyed


ROOT_DIR = Path(__file__).resolve(strict=True).parent.parent.parent
# django_docker_pycharm/
APPS_DIR = ROOT_DIR / "backend"
env = environ.Env()

READ_DOT_ENV_FILE = env.bool("DJANGO_READ_DOT_ENV_FILE", default=False)
if READ_DOT_ENV_FILE:
    # OS environment variables take precedence over variables from .env
    env.read_env(str(ROOT_DIR / ".env"))

# GENERAL
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#debug
DEBUG = env.bool("DJANGO_DEBUG", False)
# Local time zone. Choices are
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# though not all of them may be available with every OS.
# In Windows, this must be set to your system time zone.
TIME_ZONE = "Asia/Kolkata"
# https://docs.djangoproject.com/en/dev/ref/settings/#language-code
LANGUAGE_CODE = "en-us"
# https://docs.djangoproject.com/en/dev/ref/settings/#site-id
SITE_ID = 1
# https://docs.djangoproject.com/en/dev/ref/settings/#use-i18n
USE_I18N = True
# https://docs.djangoproject.com/en/dev/ref/settings/#use-l10n
USE_L10N = True
# https://docs.djangoproject.com/en/dev/ref/settings/#use-tz
USE_TZ = True

# URLS
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#root-urlconf
ROOT_URLCONF = "config.urls"
# https://docs.djangoproject.com/en/dev/ref/settings/#wsgi-application
WSGI_APPLICATION = "config.wsgi.application"
ASGI_APPLICATION = "config.routing.application"

# APPS
# ------------------------------------------------------------------------------
DJANGO_APPS = [
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.sites",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "django.contrib.admin",
]
THIRD_PARTY_APPS = [
    "storages",
    "django_celery_beat",
    "rest_framework",
    "corsheaders",
    "channels",
    "oauth2_provider",
    "social_django",
    "rest_framework_social_oauth2",
    "drf_yasg",
    "djmoney",
    "djmoney.contrib.exchange",
]

LOCAL_APPS = [
    "backend.users.apps.UsersConfig",
    "backend.products.apps.ProductsConfig",
]
# https://docs.djangoproject.com/en/dev/ref/settings/#installed-apps
INSTALLED_APPS = DJANGO_APPS + THIRD_PARTY_APPS + LOCAL_APPS

# AUTHENTICATION
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#authentication-backends
AUTHENTICATION_BACKENDS = [
    "django.contrib.auth.backends.ModelBackend",
    "django.contrib.auth.backends.ModelBackend",
    "social_core.backends.facebook.FacebookAppOAuth2",
    "social_core.backends.facebook.FacebookOAuth2",
    "social_core.backends.google.GoogleOAuth2",
]
MIN_PASSWORD_LENGTH = 6
PASSWORD_MIN_GUESSES = 1000
# Facebook configuration
SOCIAL_AUTH_FACEBOOK_KEY = env("SOCIAL_AUTH_FACEBOOK_KEY", default="")
SOCIAL_AUTH_FACEBOOK_SECRET = env("SOCIAL_AUTH_FACEBOOK_KEY", default="")
SOCIAL_AUTH_FACEBOOK_SCOPE = ["email"]
SOCIAL_AUTH_FACEBOOK_PROFILE_EXTRA_PARAMS = {"fields": "id, name, email"}

# Google configuration
SOCIAL_AUTH_GOOGLE_OAUTH2_KEY = env("SOCIAL_AUTH_GOOGLE_OAUTH2_KEY", default="")
SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET = env("SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET", default="")

# Define SOCIAL_AUTH_GOOGLE_OAUTH2_SCOPE to get extra permissions from Google.
SOCIAL_AUTH_GOOGLE_OAUTH2_SCOPE = [
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/userinfo.profile",
]

# https://docs.djangoproject.com/en/dev/ref/settings/#auth-user-model
AUTH_USER_MODEL = "users.User"

# # https://django-oauth-toolkit.readthedocs.io/en/latest/settings.html
JWT_ISSUER = "OneIssuer"
JWT_ID_ATTRIBUTE = "id"
JWT_PRIVATE_KEY_ONEISSUER = """
-----BEGIN RSA PRIVATE KEY-----
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
-----END RSA PRIVATE KEY-----
"""
JWT_PUBLIC_KEY_ONEISSUER = """
-----BEGIN PUBLIC KEY-----
MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAqaCFf3TfjEpixrdumJOZ
ZyOTb8Hp1+tn7Lsb7BAsqpg8fdQpr/IeuCuUpHkiT/qHEU2HL+u0hNMASRmXcEJS
lQ9kOyA6Kd0pPcMRwxMuo9sQwk2gCF3wg90c/FBR0zz2Ik/hDAuxqPrKDq+2lM8q
RtgDUkmlTBFLMm24JnKhCmZTpYYlqJ4u5/lo3JPzA+7bbL49xVGToGN79PslI2mM
LJf2nU9ieXIEvIe2/dKQ9i1Yppb0Zo7dMHGOzZwK6+Opv/vBIhbs6ByrichzT1SA
6S33M1dezzpJR0JZX9IbHUWoQL0wwTgw4IctpZuEJJohkBlsxD1NcucxYwyYGmmS
UDCCLZnvV6fXl5jQN7U8WdDhcGflNhSTipGYfarVvfs+V79xjscWT7G8lqfARAVm
G33t7YEoTm+ASrZU2gsWH8amlLEu5mtfasjQtzhvpcWQDULHBl5hLE4TgkTF00Y5
GZw6DNNeslN0AFSVFlSa+v6QgEq3pe9IpYx4WSwN0epX9VRexIqgoRJrFrmkzktS
qKdUo8p0d0P+dQqACMb6LvcHJPSd3nrwupyimuWQI5QsTqUceMqM8OGuyBwVvgRM
eF1WeQU2O9mcVlRFw2PJKAGq+25vBAt2LEUWpji+lmTXUt55H5C8eistt3o2wjUR
O19OLBxcVqX/dgI7bKT/DQMCAwEAAQ==
-----END PUBLIC KEY-----
"""
REFRESH_TOKEN_EXPIRE_SECONDS = 2592000  # one month
ACCESS_TOKEN_EXPIRE_SECONDS = 36000  # one hour
# PASSWORDS
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#password-hashers
PASSWORD_HASHERS = [
    # https://docs.djangoproject.com/en/dev/topics/auth/passwords/#using-argon2-with-django
    "django.contrib.auth.hashers.Argon2PasswordHasher",
    "django.contrib.auth.hashers.PBKDF2PasswordHasher",
    "django.contrib.auth.hashers.PBKDF2SHA1PasswordHasher",
    "django.contrib.auth.hashers.BCryptSHA256PasswordHasher",
]
# https://docs.djangoproject.com/en/dev/ref/settings/#auth-password-validators
AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator"
    },
    {"NAME": "django.contrib.auth.password_validation.MinimumLengthValidator"},
    {"NAME": "django.contrib.auth.password_validation.CommonPasswordValidator"},
    {"NAME": "django.contrib.auth.password_validation.NumericPasswordValidator"},
]

# MIDDLEWARE
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#middleware
MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "corsheaders.middleware.CorsMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.common.BrokenLinkEmailsMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
    # "backend.utils.middleware.AuthMiddleware"
]

# STATIC
# -----------------------------------------------------------------------------

STATIC_LOCATION = "static"
MEDIA_LOCATION = "media"

STATIC_ROOT = str(ROOT_DIR / "staticfiles")
STATICFILES_DIRS = [str(APPS_DIR / "static")]

MEDIA_ROOT = str(APPS_DIR / "media")

# azure storage

AZURE_ACCOUNT_NAME = env("AZURE_ACCOUNT_NAME", default="")
AZURE_ACCOUNT_KEY = env("AZURE_ACCOUNT_KEY", default="")

DEFAULT_FILE_STORAGE = "backend.utils.storage.AzureMediaStorage"
STATICFILES_STORAGE = "backend.utils.storage.AzureStaticStorage"

AZURE_CUSTOM_DOMAIN = f"{AZURE_ACCOUNT_NAME}.blob.core.windows.net"

STATIC_URL = f"https://{AZURE_CUSTOM_DOMAIN}/{STATIC_LOCATION}/"
MEDIA_URL = f"https://{AZURE_CUSTOM_DOMAIN}/{MEDIA_LOCATION}/"

STATICFILES_FINDERS = [
    "django.contrib.staticfiles.finders.FileSystemFinder",
    "django.contrib.staticfiles.finders.AppDirectoriesFinder",
]

# TEMPLATES
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#templates
TEMPLATES = [
    {
        # https://docs.djangoproject.com/en/dev/ref/settings/#std:setting-TEMPLATES-BACKEND
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        # https://docs.djangoproject.com/en/dev/ref/settings/#template-dirs
        "DIRS": [str(APPS_DIR / "templates")],
        "OPTIONS": {
            # https://docs.djangoproject.com/en/dev/ref/settings/#template-loaders
            # https://docs.djangoproject.com/en/dev/ref/templates/api/#loader-types
            "loaders": [
                "django.template.loaders.filesystem.Loader",
                "django.template.loaders.app_directories.Loader",
            ],
            # https://docs.djangoproject.com/en/dev/ref/settings/#template-context-processors
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.template.context_processors.i18n",
                "django.template.context_processors.media",
                "django.template.context_processors.static",
                "django.template.context_processors.tz",
                "django.contrib.messages.context_processors.messages",
                "social_django.context_processors.backends",
                "social_django.context_processors.login_redirect",
            ],
        },
    }
]

# FIXTURES
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#fixture-dirs
FIXTURE_DIRS = (str(APPS_DIR / "fixtures"),)

# SECURITY
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#session-cookie-httponly
SESSION_COOKIE_HTTPONLY = True
# https://docs.djangoproject.com/en/dev/ref/settings/#csrf-cookie-httponly
CSRF_COOKIE_HTTPONLY = True
# https://docs.djangoproject.com/en/dev/ref/settings/#secure-browser-xss-filter
SECURE_BROWSER_XSS_FILTER = True
# https://docs.djangoproject.com/en/dev/ref/settings/#x-frame-options
X_FRAME_OPTIONS = "DENY"

# EMAIL
# ------------------------------------------------------------------------------

# https://docs.djangoproject.com/en/dev/ref/settings/#email-timeout
EMAIL_TIMEOUT = 5

# ADMIN
# ------------------------------------------------------------------------------
# Django Admin URL.
ADMIN_URL = "admin/"
# https://docs.djangoproject.com/en/dev/ref/settings/#admins
ADMINS = [("""Tejpratap Singh""", "Tejpratapsingh545@outlook.com")]
# https://docs.djangoproject.com/en/dev/ref/settings/#managers
MANAGERS = ADMINS

# LOGGING
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#logging
# See https://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "verbose": {
            "format": "%(levelname)s %(asctime)s %(module)s "
            "%(process)d %(thread)d %(message)s"
        }
    },
    "handlers": {
        "console": {
            "level": "DEBUG",
            "class": "logging.StreamHandler",
            "formatter": "verbose",
        }
    },
    "root": {"level": "INFO", "handlers": ["console"]},
}

# django-channel

CHANNEL_LAYERS = {  # https://pypi.org/project/channels-rabbitmq/#Usage
    "default": {
        "BACKEND": "channels_rabbitmq.core.RabbitmqChannelLayer",
        "CONFIG": {
            "host": env("RABBITMQ_URL", default="amqp://guest:guest@127.0.0.1/asgi"),
            # "ssl_context": ... (optional)
        },
    },
}

# -------------------------------------------------------------------------------
# django-rest-framework - https://www.django-rest-framework.org/api-guide/settings/
REST_FRAMEWORK = {
    "DEFAULT_AUTHENTICATION_CLASSES": [
        "backend.utils.authentication.SocialAuthentication",
        "rest_framework.authentication.SessionAuthentication",
        "rest_framework.authentication.TokenAuthentication",
        "oauth2_provider.contrib.rest_framework.OAuth2Authentication",
    ],
    "DEFAULT_PERMISSION_CLASSES": [],
    "DEFAULT_RENDERER_CLASSES": [
        "rest_framework.renderers.JSONRenderer",
        "rest_framework.renderers.BrowsableAPIRenderer",
    ],
    "DEFAULT_PARSER_CLASSES": [
        "rest_framework.parsers.JSONParser",
        "rest_framework.parsers.FormParser",
        "rest_framework.parsers.MultiPartParser",
        "rest_framework.parsers.FileUploadParser",
    ],
}

# django money
# https://github.com/django-money/django-money#adding-a-new-currency


RS = moneyed.add_currency(
    code="INR",
    numeric="068",
    name="Indian Rupee",
    countries=("India",),
)

# Currency Formatter will output 2.000,00 Rs.
_FORMATTER.add_sign_definition("default", RS, prefix="Rs. ")

_FORMATTER.add_formatting_definition(
    "en_IN",
    group_size=3,
    group_separator=".",
    decimal_point=",",
    positive_sign="",
    trailing_positive_sign="",
    negative_sign="-",
    trailing_negative_sign="",
    rounding_method=ROUND_HALF_EVEN,
)

CURRENCIES = ("USD", "EUR", "INR")
CURRENCY_CHOICES = [("USD", "USD $"), ("EUR", "EUR €"), ("INR", "INR ₹")]

# EXCHANGE_BACKEND = "djmoney.contrib.exchange.backends.FixerBackend"
OPEN_EXCHANGE_RATES_APP_ID = env("OPEN_EXCHANGE_RATES_APP_ID", default="")
OPEN_EXCHANGE_RATES_URL = "https://openexchangerates.org/api/historical/2017-01-01.json?symbols=EUR,NOK,SEK,CZK,INR"

# Celery
# ------------------------------------------------------------------------------
# http://docs.celeryproject.org/en/latest/userguide/configuration
CELERY_TIMEZONE = TIME_ZONE
CELERY_BROKER_URL = env(
    "CELERY_BROKER_URL", default="amqp://guest:guest@localhost:5672//"
)
CELERY_RESULT_BACKEND = env("CELERY_RESULT_BACKEND", default="db+sqlite:///results.db")
CELERY_CACHE_BACKEND = "django-cache"
CELERY_ACCEPT_CONTENT = ["json"]
CELERY_TASK_SERIALIZER = "json"
CELERY_RESULT_SERIALIZER = "json"
CELERY_TASK_TIME_LIMIT = 5 * 60
CELERY_TASK_SOFT_TIME_LIMIT = 60
CELERY_BEAT_SCHEDULER = "django_celery_beat.schedulers:DatabaseScheduler"
