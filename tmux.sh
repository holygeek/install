#!/bin/sh
d=`dirname $0`
vcs=git
. $d/common.sh
${vcs}_exit_if_no_changes Tmux
if [ ! -x configure ]; then ./autogen.sh; fi

#configure:         macOS library support for Unicode is very poor,
#configure:         particularly for complex codepoints like emojis;
#configure:         to use these correctly, configuring with
#configure:         --enable-utf8proc is recommended. To build
#configure:         without anyway, use --disable-utf8proc
os=`uname`
configure_opt=
if [ "$os" = Darwin ]; then
	# Need utf8proc, brew install utf8proc
	configure_opt="CFLAGS=-I/opt/homebrew/include LDFLAGS=-L/opt/homebrew/lib --enable-utf8proc"
fi

prefix=/opt/tmux
if [ -d $prefix ]; then
	if [ -d "$prefix.old" ]; then
		rm -rf $prefix.old
	fi
	mv $prefix $prefix.old
fi

$linefan ./configure --prefix=$prefix $configure_opt &&
$linefan make prefix=$prefix -j$parallel install &&
${vcs}_update_lastbuilt
