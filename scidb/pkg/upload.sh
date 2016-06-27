#!/bin/bash

USER=rvernica
# API_KEY=

names="\
scidb-15.7 \
scidb-15.7-all-coord \
scidb-15.7-client \
scidb-15.7-client-python \
scidb-15.7-plugins \
scidb-15.7-utils"


for name in $names
do
    echo Package $name

    echo 1. Create
    env NAME=$name envsubst < create.json.tmpl | \
        curl --data @- \
             --header "Content-Type: application/json" \
             --user $USER:$API_KEY \
             "https://api.bintray.com/packages/rvernica/deb"

    echo; echo 2. Upload
    curl --upload-file deb/${name}_0-9267_amd64.deb \
         --user $USER:$API_KEY \
         "https://api.bintray.com/content/rvernica/deb/${name}/0-9267/${name}_0-9267_amd64.deb;deb_distribution=jessie;deb_component=main;deb_architecture=amd64"
    echo; echo
done
