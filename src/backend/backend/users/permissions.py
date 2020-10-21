from backend.users.models import Profile
from django.db.models import Q
from rest_framework import permissions


class IsOwner(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return obj.email == request.user.email


class IsCustomer(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return request.user.is_admin


class IsSeller(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return request.user.is_admin


class IsOwnerProfile(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        return obj.profile_set.get().user.email == request.user.email
