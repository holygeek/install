#!/bin/sh
d=`dirname $0`
vcs=git 
. $d/common.sh
${vcs}_exit_if_no_changes Perf
$linefan make -j$parallel prefix=/usr/local install-man &&
$linefan make -j$parallel prefix=/usr/local install &&
${vcs}_update_lastbuilt
