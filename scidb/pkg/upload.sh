#!/bin/bash

USERNAME=rvernica
# APIKEY=
# PASSPHRASE=

version="0-9267"
names="\
scidb-15.7 \
scidb-15.7-all-coord \
scidb-15.7-client \
scidb-15.7-client-python \
scidb-15.7-plugins \
scidb-15.7-utils"

# version="15.12"
# names="shim"


for name in $names
do
    echo Package $name

    echo "1. Create"
    env NAME=$name envsubst < create.json.tmpl | \
        curl --request POST --user $USERNAME:$APIKEY \
             --header "Content-Type: application/json" \
             --data @- \
             "https://api.bintray.com/packages/$USERNAME/deb"

    echo; echo "2. Upload (Override) & Publish"
    curl --request PUT --user $USERNAME:$APIKEY \
         --header "X-GPG-PASSPHRASE: $PASSPHRASE" \
         --header "X-Bintray-Debian-Distribution: jessie" \
         --header "X-Bintray-Debian-Component: main" \
         --header "X-Bintray-Debian-Architecture: amd64" \
         --upload-file deb/${name}_${version}_amd64.deb \
         "https://api.bintray.com/content/$USERNAME/deb/$name/$version/${name}_${version}_amd64.deb?publish=1&override=1"
    echo; echo
done
