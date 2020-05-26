#!/bin/bash

CUR_WEEK=`date +"%U"`
DEST="/var/www/html/mirror/docker/buster/buster_10.3_w""$CUR_WEEK"
mkdir -p $DEST
if [ $? -ne 0 ]
then
    echo "$0: Could not create path [$DEST]"
    exit 1
fi

pushd $DEST
if [ $? -ne 0 ]
then
    echo "$0: Could not pushd into path [$DEST]"
    exit 1
fi

wget -r -np -k https://download.docker.com/linux/debian/dists/buster/pool/stable/amd64/
wget -r -np -k https://download.docker.com/linux/debian/dists/buster/pool/stable/arm64/

popd

