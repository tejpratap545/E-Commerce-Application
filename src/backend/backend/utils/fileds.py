from .validators import CCNumberValidator, CSCValidator, expiry_date, get_digits
from django.core.exceptions import ValidationError
from django.core.validators import MinLengthValidator
from django.db import models
from django.utils.translation import gettext_lazy as _

import datetime


class CardNumberField(models.CharField):
    default_validators = [
        MinLengthValidator(13),
        CCNumberValidator(),
    ]
    description = _("Card number")

    def __init__(self, *args, **kwargs):
        kwargs.setdefault("max_length", 25)
        super().__init__(*args, **kwargs)

    def to_python(self, value):
        return get_digits(super().to_python(value))


class CardExpiryField(models.DateField):
    input_formats = ["%m/%y", "%m/%Y", "%Y-%m-%d"]
    default_error_messages = {
        "invalid": _(
            "'%(value)s' value has an invalid date format. "
            "Expiry date must be in the format MM/YY or MM/YYYY."
        )
    }
    description = _("Card expiration date")

    def to_python(self, value):
        if value is None:
            return value
        if isinstance(value, (datetime.datetime, datetime.date)):
            return expiry_date(value.year, value.month)

        for fmt in self.input_formats:
            try:
                date = datetime.datetime.strptime(value, fmt).date()
                return expiry_date(date.year, date.month)
            except ValueError:
                pass

        raise ValidationError(
            self.error_messages["invalid"], code="invalid", params={"value": value},
        )


class SecurityCodeField(models.CharField):
    default_validators = [CSCValidator()]
    description = _("Card security code")

    def __init__(self, *args, **kwargs):
        kwargs.setdefault("max_length", 4)
        super().__init__(*args, **kwargs)
