#!/bin/sh
#!/bin/sh
d=`dirname $0`
vcs=hg
. $d/common.sh
${vcs}_exit_if_no_changes Go
cd src && ./all.bash &&
${vcs}_update_lastbuilt
