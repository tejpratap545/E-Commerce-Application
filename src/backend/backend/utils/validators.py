from django.core.exceptions import ValidationError
from django.core.validators import RegexValidator
from django.utils.deconstruct import deconstructible
from django.utils.translation import gettext_lazy as _

import calendar
import datetime
import re


LUHN_ODD_LOOKUP = (0, 2, 4, 6, 8, 1, 3, 5, 7, 9)  # sum_of_digits(index * 2)
re_non_digits = re.compile(r"[^\d]+")


def get_digits(value):
    """
    Get all digits from input string.
    :type value: str
    :rtype: str
    """
    if not value:
        return ""
    return re_non_digits.sub("", str(value))


def luhn(number):
    """
    Validate credit card number with Luhn's Algorithm.
    Source:
    https://github.com/django/django-localflavor/blob/master/localflavor/generic/checksums.py
    :type number: str
    :rtype: bool
    """
    number = str(number)
    try:
        evens = sum(int(c) for c in number[-1::-2])
        odds = sum(LUHN_ODD_LOOKUP[int(c)] for c in number[-2::-2])
        return (evens + odds) % 10 == 0
    except ValueError:
        return False


def expiry_date(year, month):
    """
    Return the last day of month.
    :type year: int
    :type month: int
    :rtype: datetime.date
    """
    weekday, day_count = calendar.monthrange(year, month)
    return datetime.date(year, month, day_count)


@deconstructible
class CCNumberValidator:
    message = _("Enter a valid credit card number.")
    code = "invalid"

    def __init__(self, message=None, code=None):
        if message is not None:
            self.message = message
        if code is not None:
            self.code = code

    def __call__(self, value):
        if not luhn(get_digits(value)):
            raise ValidationError(self.message, code=self.code)

    def __eq__(self, other):
        return (
            isinstance(other, self.__class__)
            and (self.message == other.message)
            and (self.code == other.code)
        )


@deconstructible
class CSCValidator(RegexValidator):
    regex = r"^\d{3,4}$"
    message = _("Enter a valid security code.")
    code = "invalid"


@deconstructible
class ExpiryDateValidator:
    message = _("This date has passed.")
    code = "date_passed"

    def __init__(self, message=None, code=None):
        if message is not None:
            self.message = message
        if code is not None:
            self.code = code

    def __call__(self, value):
        get_expiry_date = expiry_date(value.year, value.month)
        if get_expiry_date < datetime.date.today():
            raise ValidationError(self.message, code=self.code)

    def __eq__(self, other):
        return (
            isinstance(other, self.__class__)
            and (self.message == other.message)
            and (self.code == other.code)
        )
