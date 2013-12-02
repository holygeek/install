#!/bin/sh

hg_built=`hg root`/.hg/lastbuilt

hg_latest_commit_rev() {
    hg log --limit 1 --template '{rev}'
}

hg_get_lastbuilt_rev() {
    rev=
    if [ -f $hg_built ]; then
	rev=`cat $hg_built`
    fi
    echo $rev
}

hg_exit_if_no_changes() {
    test -n "$IGNORE_LASTBUILT" && return
    rev=`hg_get_lastbuilt_rev`
    if [ "`hg_latest_commit_rev`" = "$rev" ]; then
	echo "$1 is already updated"
	exit 0
    fi
}

hg_update_lastbuilt() {
    hg_latest_commit_rev > $hg_built
}
