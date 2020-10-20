from backend.users.api.serializers import (
    BillingAddressSerializers,
    PasswordChangeSerializer,
    ShippingAddressSerializers,
    UserProfileSerializers,
    UserSerializers,
    UserSignupSerializer,
)
from backend.users.models import BillingAddress, PasswordTooWeakError, Profile, ShippingAddress, User
from backend.users.permissions import IsOwner, IsOwnerProfile
from rest_framework import mixins, status, viewsets
from rest_framework.decorators import api_view
from rest_framework.generics import GenericAPIView
from rest_framework.mixins import (
    CreateModelMixin,
    DestroyModelMixin,
    ListModelMixin,
    RetrieveModelMixin,
    UpdateModelMixin,
)
from rest_framework.response import Response
from rest_framework.views import APIView


class SignUpUserView(CreateModelMixin, GenericAPIView):
    serializer_class = UserSignupSerializer

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)


class UserUpdateView(UpdateModelMixin, GenericAPIView):
    serializer_class = UserSignupSerializer
    permission_classes = [IsOwner]

    def get_object(self):
        return self.request.user

    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

    def patch(self, request, *args, **kwargs):
        return self.partial_update(request, *args, **kwargs)


class PasswordChangeView(CreateModelMixin, GenericAPIView):
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


class ProfileView(RetrieveModelMixin, GenericAPIView):

    permission_classes = [IsOwner]
    serializer_class = UserProfileSerializers

    def get(self, request, format=None):
        profile = Profile.objects.filter(user=self.request.user)
        serializer = UserProfileSerializers(profile, many=True)
        return Response(serializer.data)


class BillingAddressViewSet(
    RetrieveModelMixin,
    UpdateModelMixin,
    CreateModelMixin,
    DestroyModelMixin,
    viewsets.GenericViewSet,
):
    serializer_class = BillingAddressSerializers
    permission_classes = [IsOwnerProfile]
    queryset = BillingAddress.objects.all()


class ShippingAddressViewSet(
    RetrieveModelMixin,
    UpdateModelMixin,
    CreateModelMixin,
    DestroyModelMixin,
    viewsets.GenericViewSet,
):
    serializer_class = ShippingAddressSerializers
    permission_classes = [IsOwnerProfile]
    queryset = ShippingAddress.objects.all()
