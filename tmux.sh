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
	configure_opt='--enable-utf8proc'
fi

$linefan ./configure --prefix=/usr/local $configure_opt &&
$linefan make -j2 install &&
${vcs}_update_lastbuilt
