#!/bin/sh
set -eu

VERSION="$(cat /opt/vdisk/VERSION 2>/dev/null || printf 'unknown')"

printf 'VDisk shim version %s\n' "$VERSION"
printf 'status: running\n'
printf 'note: no API, ABI, or storage implementation is present\n'

shutdown() {
    printf 'VDisk shim stopping\n'
    exit 0
}

trap shutdown TERM INT

while :
do
    sleep 3600 &
    wait $!
done
