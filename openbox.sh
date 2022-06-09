#!/bin/sh
d=`dirname $0`
vcs=git
. $d/common.sh
${vcs}_exit_if_no_changes Openbox
$linefan ./configure --prefix=${prefix:-/usr/local} &&
$linefan make -j$parallel install &&
${vcs}_update_lastbuilt
