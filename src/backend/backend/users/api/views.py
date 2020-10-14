from backend.users.api.serializers import (
    CustomUserSignUpSerializer,
    PasswordChangeSerializer,
    SellerUserSignUpSerializers,
    UserSignupSerializer,
)
from backend.users.models import PasswordTooWeakError, User
from backend.users.permissions import IsOwner
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.generics import GenericAPIView
from rest_framework.mixins import CreateModelMixin, RetrieveModelMixin, UpdateModelMixin
from rest_framework.response import Response
from rest_framework.views import APIView


class SignUpUserView(
    CreateModelMixin, RetrieveModelMixin, UpdateModelMixin, GenericAPIView
):
    def get_serializer_class(self):
        user_type = self.request.data.get("user_type", "customer")
        return (
            SellerUserSignUpSerializers
            if user_type == "seller"
            else CustomUserSignUpSerializer
        )

    def post(self, request, *args, **kwargs):
        return self.create(request)


class UserView(RetrieveModelMixin, UpdateModelMixin, GenericAPIView):
    serializer_class = UserSignupSerializer
    permission_classes = [IsOwner]
    queryset = User.objects.all()
    lookup_field = "id"

    def get_serializer_class(self):
        user_type = self.request.data.get("user_type", "customer")
        if user_type == "admin":
            pass
        elif user_type == "seller":
            return CustomUserSignUpSerializer
        else:
            return SellerUserSignUpSerializers

    def get(self, request, id=None):
        return self.retrieve(request, id)

    def put(self, request, id=None, *args, **kwargs):
        return self.update(request, id=id)

    def patch(self, request, id=None):
        return self.partial_update(request, id=id)


class PasswordChangeView(APIView):
    permission_classes = [IsOwner]
    serializer_class = PasswordChangeSerializer

    def post(self, request):
        serializer = PasswordChangeSerializer(data=request.data)
        if serializer.is_valid():
            if request.user.check_password(request.data.get("old_password")):

                try:
                    request.user.set_password(request.data.get("password1"))
                    request.user.save()
                    return Response(
                        data="Password is successfully change",
                        status=status.HTTP_202_ACCEPTED,
                    )
                except PasswordTooWeakError:
                    return Response(
                        data="Week Password", status=status.HTTP_400_BAD_REQUEST
                    )
            return Response(data="Wrong password", status=status.HTTP_400_BAD_REQUEST)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(["GET"])
def check_email(request):
    email = request.query_params["email"]
    if User.objects.only("email").filter(email=email).exists():
        return Response(
            data="User with this email is already exits",
            status=status.HTTP_400_BAD_REQUEST,
        )

    return Response(data="This email is available", status=status.HTTP_200_OK)


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
