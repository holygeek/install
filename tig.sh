#!/bin/sh
d=`dirname $0`
vcs=git 
. $d/common.sh
${vcs}_exit_if_no_changes Tig
./configure --prefix=/usr/local &&
	make -j3 install &&
${vcs}_update_lastbuilt
