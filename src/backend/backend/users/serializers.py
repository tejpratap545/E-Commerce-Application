from .models import User
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
