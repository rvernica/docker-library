#!/bin/sh


## 1. Start Carbon daemon
## 2. Generate Secret Key for Django application
## 3. Start Django application using Gunicorn/graphite-devel-server


export PYTHONPATH=/opt/graphite/webapp:/opt/graphite/whisper:/opt/graphite/webapp/graphite
export DJANGO_SETTINGS_MODULE=graphite.settings

/opt/graphite/bin/carbon-cache.py start

if [ "$1" == "--debug" ]
then
    python /usr/local/bin/post-setup-graphite-web.py --debug
    exec /opt/graphite/bin/run-graphite-devel-server.py \
        --libs=/opt/graphite/webapp/ /opt/graphite/
else
    python /usr/local/bin/post-setup-graphite-web.py
    exec /usr/bin/gunicorn graphite_wsgi:application --workers 4 --bind :8080
fi
