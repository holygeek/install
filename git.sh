#!/bin/sh
d=`dirname $0`
vcs=git 
. $d/common.sh

libpcredir=
case "$mach" in
	Darwin) libpcredir=LIBPCREDIR=/opt/homebrew;;
esac

test -n "$INSTALL" && ${vcs}_exit_if_no_changes Git
$linefan make PREFIX=${prefix:-/usr/local} \
    CC=clang \
    USE_LIBPCRE=YesPlease \
    $libpcredir \
    NO_GETTEXT=YesPlease \
    $INSTALL -j$parallel &&
    test -n "$INSTALL" &&
    $linefan make PREFIX=${prefix:-/usr/local} quick-install-doc &&
${vcs}_update_lastbuilt
