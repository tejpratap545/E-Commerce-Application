from ..utils.backend import encode_token, decode_jwt
from .models import User
from .permissions import IsOwner
from .serializers import UserSignupSerializer
from django.conf import settings
from django.db.models import Q
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.generics import GenericAPIView
from rest_framework.mixins import CreateModelMixin, RetrieveModelMixin, UpdateModelMixin
from rest_framework.response import Response
from rest_framework_social_oauth2.views import TokenView

import json
import logging


logger = logging.getLogger(__name__)


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


class TokenView(TokenView):
    def _generate_tokens(self, request):

        url, headers, body, status = self.create_token_response(request._request)
        dummy_responce = json.loads(body)
        if "access_token" in dummy_responce:
            dummy_responce["access_token"] = encode_token(
                token=dummy_responce["access_token"],
                token_type="access_token",
                token_expiry=settings.ACCESS_TOKEN_EXPIRE_SECONDS,
                token_provider="password",
            )
        if "refresh_token" in dummy_responce:
            dummy_responce["refresh_token"] = encode_token(
                dummy_responce["refresh_token"],
                token_type="refresh_token",
                token_expiry=settings.REFRESH_TOKEN_EXPIRE_SECONDS,
                token_provider="password",
            )
        response = Response(data=dummy_responce, status=status)

        for k, v in headers.items():
            response[k] = v
        return response

    def post(self, request: object, *args, **kwargs):
        from rest_framework import status

        grant_type = request.data.get("grant_type")
        if grant_type == "password":
            username = request.data.get("username")
            password = request.data.get("password")
            try:
                user = User.objects.only("email", "contact_number").get(
                    Q(email=username) | Q(contact_number=username)
                )
                if user.check_password(password):
                    request._request.POST = request._request.POST.copy()
                    for key, value in request.data.items():
                        request._request.POST[key] = value
                    request._request.POST["username"] = user.email
                    return self._generate_tokens(request)

                return Response(data="wrong password", status=status.HTTP_404_NOT_FOUND)

            except User.DoesNotExist:
                return Response(
                    data="User is not exits", status=status.HTTP_404_NOT_FOUND
                )

        elif grant_type == "refresh_token":
            request._request.POST = request._request.POST.copy()
            for key, value in request.data.items():
                request._request.POST[key] = value
            request._request.POST["refresh_token"] = decode_jwt(
                request.data["refresh_token"]
            )
            return self._generate_tokens(request)

        else:
            return Response(
                data="Invalid grant type request", status=status.HTTP_404_NOT_FOUND
            )
