from backend.users.api.serializers import (
    BillingAddressSerializers,
    PasswordChangeSerializer,
    PasswordResetDoneSerializers,
    PasswordResetSendSerializers,
    PasswordResetVerifySerializers,
    ShippingAddressSerializers,
    UserProfileSerializers,
    UserSerializers,
    UserSignupSerializer,
)
from backend.users.models import (
    BillingAddress,
    EmailConfirmation,
    PasswordTooWeakError,
    Profile,
    ShippingAddress,
    User,
)
from backend.users.permissions import IsOwner, IsOwnerProfile
from django.db.models import Q
from rest_framework import mixins, status, viewsets
from rest_framework.decorators import api_view, permission_classes
from rest_framework.generics import (
    CreateAPIView,
    GenericAPIView,
    ListAPIView,
    RetrieveAPIView,
    UpdateAPIView,
)
from rest_framework.mixins import (
    CreateModelMixin,
    DestroyModelMixin,
    ListModelMixin,
    RetrieveModelMixin,
    UpdateModelMixin,
)
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response


class SignUpUserView(CreateAPIView):
    serializer_class = UserSignupSerializer


class UserUpdateView(UpdateAPIView):
    serializer_class = UserSignupSerializer
    permission_classes = [IsOwner]

    def get_object(self):
        return self.request.user


class PasswordChangeView(CreateAPIView):
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
                        data={"msg": "Password is successfully change"},
                        status=status.HTTP_202_ACCEPTED,
                    )
                except PasswordTooWeakError:
                    return Response(
                        data={"msg": "Password is too week"},
                        status=status.HTTP_400_BAD_REQUEST,
                    )
            return Response(data="Wrong password", status=status.HTTP_400_BAD_REQUEST)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(["GET"])
def check_email(request):
    email = request.query_params["email"]
    if User.objects.only("email").filter(email=email).exists():
        return Response(
            data={"msg": "User with this email is already exits"},
            status=status.HTTP_400_BAD_REQUEST,
        )

    return Response(data={"msg": "This email is available"}, status=status.HTTP_200_OK)


@api_view(["GET"])
def check_contact_number(request):
    contact_number = request.query_params["contact_number"]
    if (
        User.objects.only("contact_number")
        .filter(contact_number=contact_number)
        .exists()
    ):
        return Response(
            data={"msg": "User with this contact number is already exits"},
            status=status.HTTP_400_BAD_REQUEST,
        )

    return Response(
        data={"msg": "This contact number is available"}, status=status.HTTP_200_OK
    )


class ProfileView(ListAPIView):

    permission_classes = [IsOwner]
    serializer_class = UserProfileSerializers

    def get_queryset(self):
        return Profile.objects.filter(user=self.request.user)


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


class PasswordResetSend(CreateModelMixin, GenericAPIView):
    serializer_class = PasswordResetSendSerializers

    def post(self, request, *args, **kwargs):
        self.create(request, *args, **kwargs)
        return Response(
            status=status.HTTP_205_RESET_CONTENT,
            data={
                "msg": "Verification email is successfully send to your email address . Thank You"
            },
        )


class PasswordResetConfirm(CreateAPIView):
    serializer_class = PasswordResetVerifySerializers


class PasswordChangeDone(CreateAPIView):
    serializer_class = PasswordResetDoneSerializers

    def post(self, request, *args, **kwargs):
        self.create(request, *args, **kwargs)
        return Response(
            status=status.HTTP_205_RESET_CONTENT,
            data={"msg": "Your password is successfully changed . Thank You"},
        )


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def confirmation_email_send(request):

    if request.user.is_email_verified:
        return Response(
            status=status.HTTP_208_ALREADY_REPORTED,
            data={"msg": "Your email is already verified"},
        )

    else:
        EmailConfirmation.objects.create(user=request.user)
        return Response(
            status=status.HTTP_200_OK,
            data={
                "msg": "Email verification link is successfully send to your email address please verify your "
                "email  address."
            },
        )


@api_view(["POST"])
def confirmation_email_verify(request):
    try:
        user = EmailConfirmation.objects.get(
            Q(id=request.data["token_id"]) & Q(token=request.data["token"])
        ).user
        user.is_email_verified = True
        user.save()

        return Response(
            status=status.HTTP_200_OK, data={"msg": "Your email is successfully verify"}
        )
    except EmailConfirmation.DoesNotExist:
        return Response(
            status=status.HTTP_404_NOT_FOUND, data={"msg": "Token is not found "}
        )
