import factory
from django.contrib.auth.models import User


class UserFactory(factory.Factory):
    class Meta:
        model = User

    username = 'John'
    email = 'doe@john.xd'
