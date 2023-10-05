from django.core.management.commands import createsuperuser
from django.core.management.base import CommandError

class Command(createsuperuser.Command):
    def handle(self, *args, **options):
        raise CommandError("Creating a superuser is not allowed from the command line.")