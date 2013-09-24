#!/bin/sh
d=`dirname $0`
vcs=hg
. $d/common.sh
${vcs}_exit_if_no_changes Vim
CC=clang ./configure \
    --enable-multibyte \
    --enable-pythoninterp=yes \
    --prefix=${1:-/usr/local} \
    --with-x \
    --with-features=huge &&
make -f Makefile -j3 install &&
${vcs}_update_lastbuilt
