#!/bin/sh
d=`dirname $0`
vcs=git
. $d/common.sh
${vcs}_exit_if_no_changes Reptyr
$linefan make install &&
${vcs}_update_lastbuilt
