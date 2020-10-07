from backend.utils.conftest import application, user
from django.urls import reverse
from faker import Faker
from rest_framework import status
from rest_framework.test import APIClient, APITestCase


fake = Faker()


def auth_api_client(resp):
    access_token = resp.json()["access_token"]
    client = APIClient()
    client.credentials(HTTP_AUTHORIZATION="Bearer password " + access_token)
    return client


class UserAuthTest(APITestCase):
    def setUp(self):
        self.normal_user = user()
        self.application = application()
        self.super_user = self.application.user
        self.get_token__url = reverse("generate jwt token")
        self.get_access_token_data = {
            "client_id": self.application.client_id,
            "client_secret": self.application.client_secret,
            "grant_type": "password",
            "username": self.normal_user.email,
            "password": "dummypassword123",
        }
        self.current_access_token = ""
        self.current_refresh_token = ""

        self.get_access_token_data_from_contact_number = {
            "client_id": self.application.client_id,
            "client_secret": self.application.client_secret,
            "grant_type": "password",
            "username": self.normal_user.contact_number.raw_input,
            "password": "dummypassword123",
        }

    def test_user_auth(self):
        user = self.normal_user
        # user.is_active = False
        # user.save()
        #
        resp = self.client.post(
            self.get_token__url,
            self.get_access_token_data,
            format="json",
        )
        self.assertEqual(resp.status_code, status.HTTP_200_OK)
        self.current_access_token = resp.json()["access_token"]
        self.current_refresh_token = resp.json()["refresh_token"]

        # test refresh_token
        client = APIClient()
        resp = client.post(
            self.get_token__url,
            {
                "client_id": self.application.client_id,
                "client_secret": self.application.client_secret,
                "grant_type": "refresh_token",
                "refresh_token": self.current_refresh_token,
            },
            format="json",
        )
        self.assertEqual(resp.status_code, status.HTTP_200_OK)

        client = auth_api_client(resp)
        resp = client.get(f"/user/{self.normal_user.id}", data={"format": "json"})
        self.assertEqual(resp.status_code, status.HTTP_200_OK)

    def test_unauthorized_token_request(self):
        client = APIClient()
        client.credentials(HTTP_AUTHORIZATION="Bearer password " + "sjsjsjjsjsjsj")
        resp = client.get(f"/user/{self.normal_user.id}", data={"format": "json"})
        self.assertEqual(resp.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_deactivate_user(self):
        u = self.normal_user
        u.is_active = False
        u.save()
        resp = self.client.post(
            self.get_token__url,
            self.get_access_token_data,
            format="json",
        )

        self.assertEqual(resp.status_code, status.HTTP_400_BAD_REQUEST)
        resp = self.client.post(
            self.get_token__url,
            self.get_access_token_data_from_contact_number,
            format="json",
        )

        self.assertEqual(resp.status_code, status.HTTP_400_BAD_REQUEST)

    def test_reactivate_user(self):
        u = self.normal_user
        u.is_active = True
        u.save()
        resp = self.client.post(
            self.get_token__url,
            self.get_access_token_data,
            format="json",
        )

        self.assertEqual(resp.status_code, status.HTTP_200_OK)
        client = auth_api_client(resp)

        resp = client.get(f"/user/{self.normal_user.id}", data={"format": "json"})
        self.assertEqual(resp.status_code, status.HTTP_200_OK)

        resp = self.client.post(
            self.get_token__url,
            self.get_access_token_data_from_contact_number,
            format="json",
        )

        self.assertEqual(resp.status_code, status.HTTP_200_OK)
        client = auth_api_client(resp)
        resp = client.get(f"/user/{self.normal_user.id}", data={"format": "json"})
        self.assertEqual(resp.status_code, status.HTTP_200_OK)
