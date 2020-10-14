from backend.users.models import User
from django.conf import settings
from django.db.models import Q
from rest_framework import serializers, status


class UserSignupSerializer(serializers.ModelSerializer):
    password = serializers.CharField(
        max_length=16, min_length=settings.MIN_PASSWORD_LENGTH, write_only=True
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


class CustomUserSignUpSerializer(UserSignupSerializer):
    class Meta:
        model = User
        fields = UserSignupSerializer.Meta.fields

    def create(self, validated_data):
        return User.objects.create_customer_user(**validated_data)


class SellerUserSignUpSerializers(UserSignupSerializer):
    class Meta:
        model = User
        fields = UserSignupSerializer.Meta.fields

    def create(self, validated_data):
        return User.objects.create_seller_user(**validated_data)


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
