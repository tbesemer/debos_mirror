#!/bin/bash

mkdir -p /var/www/html/mirror/xilinx
if [ $? -ne 0 ]
then
    echo "$0: Can't mkdir on /var/www/html/mirror"
    exit 1
fi

pushd /var/www/html/mirror/xilinx
if [ $? -ne 0 ]
then
    echo "$0: Can't pushd into /var/www/html/mirror"
    exit 1
fi

wget -r -np -k http://petalinux.xilinx.com/sswreleases/rel-v2019/
wget -r -np -k http://petalinux.xilinx.com/sswreleases/rel-v2019.1/

popd
