from ..utils.backend import encode_token, decode_jwt
from .models import User
from django.conf import settings
from django.db.models import Q
from rest_framework.response import Response
from rest_framework_social_oauth2.views import TokenView

import json
import logging


logger = logging.getLogger(__name__)


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


