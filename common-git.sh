#!/bin/sh

git_built=.git/lastbuilt

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
    hash=`git_get_lastbuilt_hash`
    if [ "`git_latest_commit_hash`" = "$hash" ]; then
	echo "$1 is already updated"
	exit 0
    fi
}

git_update_lastbuilt() {
    git_latest_commit_hash > $git_built
}
