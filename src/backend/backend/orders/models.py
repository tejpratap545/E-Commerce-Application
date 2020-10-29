# Create your models here.
from backend.shopit.models import ProductInfo
from backend.users.models import BillingAddress, ShippingAddress, User
from django.db import models


class Beg(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(ProductInfo, on_delete=models.CASCADE)
    quantity = models.PositiveSmallIntegerField(default=1)

    def __str__(self):
        return f"user : {self.user.email} product : {self.product} quantity :{self.quantity}"


class ShoppingCart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    beg = models.ManyToManyField(Beg)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"user : {self.user.email} created at {self.created_at}"


class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    beg = models.ManyToManyField(Beg)
    shipping_address = models.ForeignKey(ShippingAddress, on_delete=models.CASCADE)
    billing_address = models.ForeignKey(BillingAddress, on_delete=models.CASCADE)
    product = models.ForeignKey(ProductInfo, on_delete=models.CASCADE)
    is_succeeded = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Order created by {self.user.email}"
