from backend.users.models import User


def test_should_create_user(db) -> None:
    user = User.objects.create_user("tejpratapsingh545@gmail.com", "888282828222")
    assert user.email == "tejpratapsingh545@gmail.com"
    assert user.contact_number == "888282828222"
    assert user.is_active
    assert not user.is_admin
    assert not user.is_superuser
    assert not user.is_staff
    assert not user.is_seller
    assert not user.is_customer


def test_should_create_admin_user(db) -> None:
    user = User.objects.create_admin_user("tejpratapsingh545@gmail.com", "888282828222")
    assert user.email == "tejpratapsingh545@gmail.com"
    assert user.contact_number == "888282828222"
    assert user.is_active
    assert user.is_admin
    assert not user.is_superuser
    assert user.is_staff
    assert not user.is_seller
    assert not user.is_customer


def test_should_superuser_user(db) -> None:
    user = User.objects.create_superuser("tejpratapsingh545@gmail.com", "888282828222")
    assert user.email == "tejpratapsingh545@gmail.com"
    assert user.contact_number == "888282828222"
    assert user.is_active
    assert user.is_admin
    assert user.is_superuser
    assert user.is_staff
    assert not user.is_seller
    assert not user.is_customer


def test_should_seller_user(db) -> None:
    user = User.objects.create_seller_user(
        "tejpratapsingh545@gmail.com", "888282828222"
    )
    assert user.email == "tejpratapsingh545@gmail.com"
    assert user.contact_number == "888282828222"
    assert user.is_active
    assert not user.is_admin
    assert not user.is_superuser
    assert not user.is_staff
    assert user.is_seller
    assert not user.is_customer


def test_should_create_customer_user(db) -> None:
    user = User.objects.create_customer_user(
        "tejpratapsingh545@gmail.com", "888282828222"
    )
    assert user.email == "tejpratapsingh545@gmail.com"
    assert user.contact_number == "888282828222"
    assert user.is_active
    assert not user.is_admin
    assert not user.is_superuser
    assert not user.is_staff
    assert not user.is_seller
    assert user.is_customer
