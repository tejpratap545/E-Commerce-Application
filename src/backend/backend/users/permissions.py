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
