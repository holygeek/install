#!/bin/sh
d=`dirname $0`
vcs=git
. $d/common.sh
${vcs}_exit_if_no_changes Password-Store
$linefan make PREFIX=${prefix:-/usr/local} install &&
${vcs}_update_lastbuilt
