#!/bin/sh
d=`dirname $0`
vcs=git 
. $d/common.sh
test -n "$INSTALL" && ${vcs}_exit_if_no_changes Git
$linefan make PREFIX=${prefix:-/usr/local} \
    CC=clang \
    USE_LIBPCRE=YesPlease \
    NO_GETTEXT=YesPlease \
    $INSTALL -j$parallel &&
    test -n "$INSTALL" &&
    $linefan make PREFIX=${prefix:-/usr/local} quick-install-doc &&
${vcs}_update_lastbuilt
