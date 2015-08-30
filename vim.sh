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
#$linefan CC=clang ./configure \
$linefan ./configure \
    --enable-multibyte \
    --enable-pythoninterp=yes \
    --prefix=${prefix:-/usr/local} \
    $with_x \
    --with-features=huge &&
$linefan make -f Makefile -j4 $INSTALL &&
${vcs}_update_lastbuilt
