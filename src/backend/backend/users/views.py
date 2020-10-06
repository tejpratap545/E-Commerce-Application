from oauth2_provider.signals import app_authorized

from .models import AccessToken, User
from .permissions import IsOwner
from .serializers import UserSignupSerializer
from backend.utils.backend import encode_jwt, generate_payload
from braces.views import CsrfExemptMixin
from django.conf import settings
from django.db.models import Q
from django.utils.module_loading import import_string
from oauth2_provider import views
from oauth2_provider.http import OAuth2ResponseRedirect
from oauth2_provider.models import get_access_token_model
from oauth2_provider.settings import oauth2_settings
from oauth2_provider.views.mixins import OAuthLibMixin
from rest_framework import permissions, status
from rest_framework.decorators import api_view
from rest_framework.generics import GenericAPIView
from rest_framework.mixins import CreateModelMixin, RetrieveModelMixin, UpdateModelMixin
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_social_oauth2.views import TokenView
from urllib.parse import parse_qs, urlencode, urlparse  # noqa

import ast
import json
import logging


logger = logging.getLogger(__name__)


class MissingIdAttribute(Exception):
    pass


class JWTAuthorizationView(APIView, CsrfExemptMixin, OAuthLibMixin):
    def get(self, request, *args, **kwargs):
        response = super(JWTAuthorizationView, self).get(request, *args, **kwargs)
        if (
            request.GET.get("response_type", None) == "token"
            and response.status_code == 302
        ):
            url = urlparse(response.url)
            params = parse_qs(url.fragment)
            if params:
                content = {
                    "access_token": params["access_token"][0],
                    "expires_in": int(params["expires_in"][0]),
                    "scope": params["scope"][0],
                }
                jwt = TokenView()._get_access_token_jwt(request, content)
                response = OAuth2ResponseRedirect(
                    "{}&access_token_jwt={}".format(response.url, jwt),
                    response.allowed_schemes,
                )
        return response


class TokenView(TokenView):
    permission_classes = (permissions.AllowAny,)

    server_class = oauth2_settings.OAUTH2_SERVER_CLASS
    validator_class = oauth2_settings.OAUTH2_VALIDATOR_CLASS
    oauthlib_backend_class = oauth2_settings.OAUTH2_BACKEND_CLASS

    def _get_access_token_jwt(self, request, content):
        extra_data = {}
        issuer = settings.JWT_ISSUER
        payload_enricher = getattr(settings, "JWT_PAYLOAD_ENRICHER", None)
        if payload_enricher:
            fn = import_string(payload_enricher)
            extra_data = fn(request)

        if "scope" in content:
            extra_data["scope"] = content["scope"]

        # id_attribute = getattr(settings, "JWT_ID_ATTRIBUTE", None)
        # if id_attribute:
        #     token = get_access_token_model().objects.get(token=content["access_token"])
        #     id_value = getattr(token.user.id, id_attribute, None)
        #     if not id_value:
        #         raise MissingIdAttribute()
        #     extra_data[id_attribute] = str(id_value)

        payload = generate_payload(issuer, content["expires_in"], **extra_data)
        token = encode_jwt(payload)
        return token

    @staticmethod
    def _is_jwt_config_set():
        issuer = getattr(settings, "JWT_ISSUER", "")
        private_key_name = "JWT_PRIVATE_KEY_{}".format(issuer.upper())
        private_key = getattr(settings, private_key_name, None)
        id_attribute = getattr(settings, "JWT_ID_ATTRIBUTE", None)
        if issuer and private_key and id_attribute:
            return True
        else:
            return False

    def post(self, request, *args, **kwargs):
        """first generate the access and refresh token trough  the django-oauth toolkit then convert this token to
        jwt with tha private key so that if anyone access the data not eligible to use the access and refresh token
        this provide an extra layer of security . this jwt token only decode from the public key
        """
        username = request.POST.get("username")
        password = request.POST.get("password")
        try:
            user = User.objects.only("email", "contact_number").get(
                Q(email=username) | Q(contact_number=username)
            )

            request._request.POST = request._request.POST.copy()
            for key, value in request.data.items():
                request._request.POST[key] = value
            request._request.POST["username"] = user.email
            url, headers, body, status = self.create_token_response(request._request)
            if status == 200:
                access_token = json.loads(body).get("access_token")
            if access_token is not None:
                token = get_access_token_model().objects.get(token=access_token)
                app_authorized.send(sender=self, request=request, token=token)
                from django.http import HttpResponse

                response = HttpResponse(content=body, status=status)

                for k, v in headers.items():
                    response[k] = v

            content = ast.literal_eval(response.content.decode("utf-8"))
            if response.status_code == 200 and "access_token" in content:
                if not TokenView._is_jwt_config_set():
                    logger.warning("Missing JWT configuration, skipping token build")
                else:
                    try:
                        content["access_token_jwt"] = self._get_access_token_jwt(
                            request, content
                        )
                        try:
                            content = bytes(json.dumps(content), "utf-8")
                        except TypeError:
                            content = bytes(json.dumps(content).encode("utf-8"))
                        response.content = content
                    except MissingIdAttribute:
                        response.status_code = 400
                        response.content = json.dumps(
                            {
                                "error": "invalid_request",
                                "error_description": "App not configured correctly. "
                                "Please set JWT_ID_ATTRIBUTE.",
                            }
                        )
            return response

        except User.DoesNotExist:
            raise User.DoesNotExist


@api_view(["GET"])
def check_contact_number(request):
    contact_number = request.query_params["contact_number"]
    if (
        User.objects.only("contact_number")
        .filter(contact_number=contact_number)
        .exists()
    ):
        return Response(
            data="User with this contact number is already exits",
            status=status.HTTP_400_BAD_REQUEST,
        )

    return Response(data="This contact number is available", status=status.HTTP_200_OK)


@api_view(["GET"])
def check_username(request):
    username = request.query_params["username"]
    if User.objects.only("username").filter(username=username).exists():
        return Response(
            data="User with this username is already exits",
            status=status.HTTP_400_BAD_REQUEST,
        )

    return Response(data="This Username is available", status=status.HTTP_200_OK)


@api_view(["GET"])
def check_email(request):
    email = request.query_params["email"]
    if User.objects.only("email").filter(email=email).exists():
        return Response(
            data="User with this email is already exits",
            status=status.HTTP_400_BAD_REQUEST,
        )

    return Response(data="This email is available", status=status.HTTP_200_OK)


class SignUpUserView(
    CreateModelMixin, RetrieveModelMixin, UpdateModelMixin, GenericAPIView
):
    serializer_class = UserSignupSerializer

    def post(self, request, *args, **kwargs):
        return self.create(request)


class UserView(RetrieveModelMixin, UpdateModelMixin, GenericAPIView):
    serializer_class = UserSignupSerializer
    permission_classes = [IsOwner]
    queryset = User.objects.all()
    lookup_field = "id"

    def get(self, request, id=None):
        return self.retrieve(request, id)

    def put(self, request, id=None, *args, **kwargs):
        return self.update(request, id=id)

    def patch(self, request, id=None):
        return self.partial_update(request, id=id)
