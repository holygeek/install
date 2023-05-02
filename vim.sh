#!/bin/sh
d=`dirname $0`
vcs=git
. $d/common.sh
test -n "$INSTALL" && ${vcs}_exit_if_no_changes Vim
os=`uname`
with_x=
if [ "$os" = Linux ]; then
	with_x=--with-x
fi

python3=$(which python3)
if [ -z "$python3" ]; then echo "no python3 found"; exit 1; fi
$linefan ./configure \
    --enable-multibyte \
    --enable-python3interp=yes \
    --enable-cscope \
    --prefix=${prefix:-/usr/local} \
    --with-python-command=$python3 \
    $with_x \
    --with-features=huge &&
$linefan make -f Makefile -j$parallel $INSTALL &&
${vcs}_update_lastbuilt
