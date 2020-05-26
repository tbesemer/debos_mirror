#!/bin/bash

CUR_WEEK=`date +"%U"`
HOST=ftp.us.debian.org;
DEST="/var/www/html/mirror/debian/buster/buster_10.3_w""$CUR_WEEK"
DIST=buster
ARCH="amd64,i386,arm64,armhf"

debmirror ${DEST} --ignore-release-gpg --nosource --method=rsync --host=${HOST} --root=/debian --dist=${DIST}  --section=main,contrib,non-free,main/debian-installer --i18n --arch=${ARCH} --passive --cleanup -v -p

