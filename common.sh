#!/bin/sh
d=`dirname $0`
case $vcs in
    hg) . $d/common-hg.sh ;;
    git) . $d/common-git.sh ;;
    *) echo "I don't grok $vcs vcs"; exit 1 ;;
esac

which linefan >/dev/null && linefan="linefan -T -"
