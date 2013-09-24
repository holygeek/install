#!/bin/sh
d=`dirname $0`
vcs=git 
. $d/common.sh
${vcs}_exit_if_no_changes Git
make prefix=/usr/local \
    CC=clang \
    USE_LIBPCRE=YesPlease \
    NO_GETTEXT=YesPlease \
    install -j2 &&
    make prefix=/usr/local quick-install-doc &&
${vcs}_update_lastbuilt
