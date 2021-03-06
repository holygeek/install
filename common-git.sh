#!/bin/sh

git_built=`git rev-parse --git-dir`/lastbuilt

git_latest_commit_hash() {
    git rev-parse HEAD
}

git_get_lastbuilt_hash() {
    hash=
    if [ -f $built ]; then
	hash=`cat $git_built`
    fi
    echo $hash
}

git_exit_if_no_changes() {
    test -n "$IGNORE_LASTBUILT" && return
    hash=`git_get_lastbuilt_hash`
    if [ "`git_latest_commit_hash`" = "$hash" ]; then
	echo "$1 is already updated"
	exit 0
    fi
    announce
}

git_update_lastbuilt() {
    git_latest_commit_hash > $git_built
}
