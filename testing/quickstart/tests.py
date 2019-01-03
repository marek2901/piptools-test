from django.test import TestCase, Client
from .factories import UserFactory

client = Client()


class EloTest(TestCase):
    def test_status_code(self):
        response = client.get('/users/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json()['count'], 0)

    def test_retrieving_all_users(self):
        UserFactory().save()
        UserFactory(username='Martin').save()
        response = client.get('/users/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json()['count'], 2)
        self.assertListEqual(list(response.json()['results'][0].keys()), [
                             'url', 'username', 'email', 'groups'])
