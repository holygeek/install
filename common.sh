#!/bin/sh
d=`dirname $0`
prefix=
INSTALL=install
IGNORE_LASTBUILT=
while getopts cfp: opt
do
    case "$opt" in
        c) INSTALL= ;;
        f) IGNORE_LASTBUILT=t ;;
        p) prefix="$OPTARG" ;;
    esac
done
shift `expr $OPTIND - 1`

case $vcs in
    hg) . $d/common-hg.sh ;;
    git) . $d/common-git.sh ;;
    *) echo "I don't grok $vcs vcs"; exit 1 ;;
esac

which linefan >/dev/null && linefan="linefan -T -"
