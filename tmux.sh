#!/bin/sh
d=`dirname $0`
vcs=git
. $d/common.sh
${vcs}_exit_if_no_changes Tmux
if [ ! -x configure ]; then ./autogen.sh; fi
$linefan ./configure --prefix=/usr/local &&
$linefan make -j2 install &&
${vcs}_update_lastbuilt
