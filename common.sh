#!/bin/sh
me=`basename $0`
usage() {
    echo -n "Usage: $me [-c] [-f] [-h] [-p <prefix>]
    -c
        Compile only

    -f
        Ignore lastbuilt

    -h
        Show this help message

    -p <prefix>
        Set configure's --prefix
"
}

d=`dirname $0`
prefix=
INSTALL=install
IGNORE_LASTBUILT=
while getopts cfhp: opt
do
    case "$opt" in
        c) INSTALL= ;;
        f) IGNORE_LASTBUILT=t ;;
        h) usage ;;
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
