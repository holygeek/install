#!/bin/sh
d=`dirname $0`
vcs=hg
. $d/common.sh
${vcs}_exit_if_no_changes Vim
os=`uname`
with_x=
if [ "$os" = Linux ]; then
	with_x=--with-x
fi
$linefan CC=clang ./configure \
    --enable-multibyte \
    --enable-pythoninterp=yes \
    --prefix=${1:-/usr/local} \
    $with_x \
    --with-features=huge &&
$linefan make -f Makefile -j3 install &&
${vcs}_update_lastbuilt
