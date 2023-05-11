#!/bin/sh
d=`dirname $0`
vcs=git 
. $d/common.sh

libpcredir=
case "$mach" in
	Darwin) libpcredir=LIBPCREDIR=/opt/homebrew;;
esac

test -n "$INSTALL" && ${vcs}_exit_if_no_changes Git

prefix=/opt/git
if [ -d $prefix ]; then
	if [ -d "$prefix.old" ]; then
		rm -rf $prefix.old
	fi
	mv $prefix $prefix.old
fi

$linefan make prefix=$prefix \
    CC=gcc \
    USE_LIBPCRE=YesPlease \
    $libpcredir \
    NO_GETTEXT=YesPlease \
    $INSTALL -j$parallel &&
    test -n "$INSTALL" &&
    $linefan make prefix=$prefix quick-install-doc &&
${vcs}_update_lastbuilt
