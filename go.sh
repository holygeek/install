#!/bin/sh
#!/bin/sh
d=`dirname $0`
vcs=hg
. $d/common.sh
${vcs}_exit_if_no_changes Go
cd src && $linefan ./all.bash &&
${vcs}_update_lastbuilt
go get -u code.google.com/p/go.tools/cmd/cover
