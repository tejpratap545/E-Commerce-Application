from backend.users.models import BillingAddress, PasswordReset, Profile, ShippingAddress, User
from django.conf import settings
from django.db.models import Q
from rest_framework import serializers, status
from rest_framework.exceptions import NotFound

import secrets


class UserSignupSerializer(serializers.ModelSerializer):
    USER_TYPE = (("C", "CUSTOMER"), ("S", "SELLER"))
    password = serializers.CharField(
        max_length=16, min_length=settings.MIN_PASSWORD_LENGTH, write_only=True
    )
    user_type = serializers.ChoiceField(
        choices=USER_TYPE, write_only=True, required=False, default="C"
    )

    class Meta:
        model = User
        fields = [
            "id",
            "email",
            "contact_number",
            "first_name",
            "last_name",
            "password",
            "date_of_birth",
            "avatar",
            "user_type",
        ]

        def validate(self, data):
            if User.objects.filter(
                Q(email=data["email"]) | Q(contact_number=data["contact_number"])
            ).exists():

                raise serializers.ValidationError(
                    "User with this email address or contact number is already exits is already exits "
                )
            return data

    def update(self, instance, validated_data):
        password = validated_data.pop("password", "")
        return super().update(instance, validated_data)

    def create(self, validated_data):
        user_type = validated_data.pop("user_type", "")
        if user_type == "S":
            return User.objects.create_seller_user(**validated_data)

        return User.objects.create_customer_user(**validated_data)


class PasswordChangeSerializer(serializers.Serializer):

    password1 = serializers.CharField(
        max_length=16,
        min_length=settings.MIN_PASSWORD_LENGTH,
        write_only=True,
        required=True,
    )
    password2 = serializers.CharField(
        max_length=16,
        min_length=settings.MIN_PASSWORD_LENGTH,
        write_only=True,
        required=True,
    )
    old_password = serializers.CharField(
        max_length=16,
        min_length=settings.MIN_PASSWORD_LENGTH,
        write_only=True,
        required=True,
    )

    def validate(self, data):
        if data["password1"] != data["password2"]:
            raise serializers.ValidationError("both password must be same")

        return data


class UserSerializers(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            "id",
            "email",
            "contact_number",
            "first_name",
            "last_name",
            "date_of_birth",
            "avatar",
            "md5_hash",
            "is_active",
            "is_admin",
            "is_email_verified",
            "is_customer",
            "is_seller",
            "date_joined",
        ]


class ShippingAddressSerializers(serializers.ModelSerializer):
    class Meta:
        model = ShippingAddress
        fields = "__all__"

    def create(self, validated_data):

        return Profile.objects.get(
            user=self.context["request"].user
        ).shipping_address.create(**validated_data)


class BillingAddressSerializers(serializers.ModelSerializer):
    class Meta:
        model = BillingAddress
        fields = "__all__"

    def create(self, validated_data):

        return Profile.objects.get(
            user=self.context["request"].user
        ).billing_address.create(**validated_data)


class UserProfileSerializers(serializers.ModelSerializer):
    user = UserSerializers(read_only=True)
    shipping_address = ShippingAddressSerializers(many=True)
    billing_address = BillingAddressSerializers(many=True)

    class Meta:
        model = Profile
        fields = [
            "user",
            "shipping_address",
            "billing_address",
            "default_shipping_address",
            "default_purchasing_address",
        ]


class PasswordResetSendSerializers(serializers.Serializer):
    username = serializers.CharField(max_length=25, write_only=True)

    def create(self, validated_data):
        username = validated_data.pop("username")

        user = User.objects.get(Q(email=username) | Q(contact_number=username))
        # delete all previous links if they exists
        PasswordReset.objects.filter(user=user).delete()
        # create new password reset token
        return PasswordReset.objects.create(user=user)

    def validate_username(self, value):
        if (
            User.objects.only("email", "contact_number")
            .filter(Q(email=value) | Q(contact_number=value))
            .exists()
        ):
            return value
        raise serializers.ValidationError("User does not exits")


class PasswordResetVerifySerializers(serializers.ModelSerializer):
    token_id = serializers.UUIDField(write_only=True)
    url_token = serializers.CharField(max_length=250, write_only=True)

    class Meta:
        model = PasswordReset
        fields = ["url_token", "success_token", "token_id"]

    def validate(self, data):
        if (
            PasswordReset.objects.only("id", "url_token")
            .filter(Q(id=data["token_id"]) & Q(url_token=data["url_token"]))
            .exists()
        ):
            return data
        raise serializers.ValidationError("Token is not validate")

    def create(self, validated_data):
        token = PasswordReset.objects.only("id", "url_token").get(
            Q(id=validated_data["token_id"]) & Q(url_token=validated_data["url_token"])
        )
        token.success_token = secrets.token_hex()
        token.save()
        return token


class PasswordResetDoneSerializers(serializers.ModelSerializer):
    token_id = serializers.UUIDField(write_only=True)
    success_token = serializers.CharField(max_length=250, write_only=True)
    password1 = serializers.CharField(
        max_length=16,
        min_length=settings.MIN_PASSWORD_LENGTH,
        write_only=True,
        required=True,
    )
    password2 = serializers.CharField(
        max_length=16,
        min_length=settings.MIN_PASSWORD_LENGTH,
        write_only=True,
        required=True,
    )

    class Meta:
        model = PasswordReset
        fields = ["token_id", "success_token", "password1", "password2"]

    def validate(self, data):
        if data["password1"] != data["password2"]:
            raise serializers.ValidationError("Both Password must be same")

        if (
            PasswordReset.objects.only("id", "success_token")
            .filter(Q(id=data["token_id"]) & Q(success_token=data["success_token"]))
            .exists()
        ):
            return data
        raise serializers.ValidationError("Not valid token ")

    def create(self, validated_data):
        user = PasswordReset.objects.get(id=validated_data["token_id"]).user
        user.set_password(validated_data["password2"])

        PasswordReset.objects.get(id=validated_data["token_id"]).delete()
        return True
