#!/bin/sh
d=`dirname $0`
IGNORE_LASTBUILT=
while getopts f opt
do
    case "$opt" in
        f) IGNORE_LASTBUILT=t ;;
    esac
done
shift `expr $OPTIND - 1`

case $vcs in
    hg) . $d/common-hg.sh ;;
    git) . $d/common-git.sh ;;
    *) echo "I don't grok $vcs vcs"; exit 1 ;;
esac

which linefan >/dev/null && linefan="linefan -T -"
