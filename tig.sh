#!/bin/sh
d=`dirname $0`
vcs=git 
. $d/common.sh
${vcs}_exit_if_no_changes Tig
$linefan ./configure --prefix=/usr/local &&
	$linefan make -j3 install &&
${vcs}_update_lastbuilt
