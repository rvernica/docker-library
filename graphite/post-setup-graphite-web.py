#!/usr/bin/env python

import os
import random
import string
import sys

from django.utils.crypto import get_random_string


## Check if the script was already executed
flag_filename = '/opt/graphite/post-setup-complete'
if os.path.isfile(flag_filename):
    sys.exit(0)


## Add SECRET_KEY to local_settings.py
settings_filename = '/opt/graphite/webapp/graphite/local_settings.py'
secret_key = get_random_string(
    50, 'abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*(-_=+)')

with open(settings_filename, 'a') as f:
    f.write("SECRET_KEY = '%s'\n" % (secret_key, ))
    if '--debug' in sys.argv:
        f.write('DEBUG = True\n')


import django
django.setup()

from django.contrib.auth.models import User


## Create Superuser
password = ''.join(
    (random.choice(string.letters + string.digits + string.punctuation))
    for x in range(20))

User.objects.create_superuser('admin', 'admin@localhost', password)
print '[graphite-web] Superuser: admin, Password: %s' % (password, )


## Set flag file
with open(flag_filename, 'w'):
    os.utime(flag_filename, None)
