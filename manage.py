


import sys

if len(sys.argv) > 1 and sys.argv[1] == 'createsuperuser':
    sys.argv[1] = 'restricted_createsuperuser'

import os
import sys

if __name__ == '__main__':
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'world.settings')

    if len(sys.argv) > 1 and sys.argv[1] == 'createsuperuser':
        sys.argv[1] = 'restricted_createsuperuser'

    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)


