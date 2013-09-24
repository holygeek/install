#!/bin/sh
d=`dirname $0`
vcs=git
. $d/common.sh
${vcs}_exit_if_no_changes Tmux
echo ./configure --prefix=/usr/local &&
echo make -j2 install &&
${vcs}_update_lastbuilt
