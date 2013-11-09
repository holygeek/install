#!/bin/sh
d=`dirname $0`
vcs=git
. $d/common.sh
${vcs}_exit_if_no_changes Tmux
./configure --prefix=/usr/local &&
make -j2 install &&
${vcs}_update_lastbuilt
