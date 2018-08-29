FROM alpine:3.8


RUN apk add --update-cache                      \
        ca-certificates                         \
        cairo                                   \
        libffi-dev                              \
        py-pip                                  \
        py-twisted                              \
    && rm -rf /var/cache/apk/*

RUN pip install --upgrade pip                   \
    &&  pip install                             \
        carbon                                  \
        gunicorn                                \
        whisper

RUN apk add --update-cache --virtual=build-deps \
        gcc                                     \
        python-dev                              \
        musl-dev                                \
    && pip install                              \
        graphite-web                            \
    && apk del build-deps                       \
    && rm -rf /var/cache/apk/*


RUN cp /opt/graphite/conf/carbon.conf.example /opt/graphite/conf/carbon.conf \
    && cp /opt/graphite/conf/storage-schemas.conf.example                    \
       /opt/graphite/conf/storage-schemas.conf                               \
    && cp /opt/graphite/webapp/graphite/local_settings.py.example            \
       /opt/graphite/webapp/graphite/local_settings.py                       \
    && cp /opt/graphite/conf/graphite.wsgi.example                           \
       /opt/graphite/webapp/graphite/graphite_wsgi.py

RUN PYTHONPATH=/opt/graphite/webapp django-admin.py           \
        collectstatic --settings=graphite.settings --no-input \
    && PYTHONPATH=/opt/graphite/webapp django-admin.py        \
        makemigrations account events dashboard url_shortener \
        --settings=graphite.settings                          \
    && PYTHONPATH=/opt/graphite/webapp django-admin.py        \
        migrate --settings=graphite.settings


EXPOSE 2003
EXPOSE 2004
EXPOSE 8080
VOLUME /opt/graphite/static


COPY post-setup-graphite-web.py /usr/local/bin/


## 1. Start Carbon daemon
## 2. Generate Secret Key for Django application
## 3. Start Django application using Gunicorn
CMD /opt/graphite/bin/carbon-cache.py start                                     \
    && PYTHONPATH=/opt/graphite/webapp DJANGO_SETTINGS_MODULE=graphite.settings \
        python /usr/local/bin/post-setup-graphite-web.py                        \
    && PYTHONPATH=/opt/graphite/whisper:/opt/graphite/webapp/graphite           \
        /usr/bin/gunicorn graphite_wsgi:application --workers 4 --bind :8080

## Start Carbon daemon and Django application in developement mode
# CMD /opt/graphite/bin/carbon-cache.py start                                            \
#     && PYTHONPATH=/opt/graphite/webapp DJANGO_SETTINGS_MODULE=graphite.settings        \
#         python /usr/local/bin/post-setup-graphite-web.py --debug                       \
#     && PYTHONPATH=/opt/graphite/whisper /opt/graphite/bin/run-graphite-devel-server.py \
#         --libs=/opt/graphite/webapp/ /opt/graphite/
