#!/bin/sh
d=`dirname $0`
vcs=git 
. $d/common.sh
${vcs}_exit_if_no_changes Perf
make -j2 prefix=/usr/local install-man &&
make -j2 prefix=/usr/local install &&
${vcs}_update_lastbuilt
