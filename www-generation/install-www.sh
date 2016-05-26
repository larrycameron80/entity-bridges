#!/bin/sh
# https://github.com/gman999/entity-bridges/
# install www build scripts and append cron entry

scriptdir="${scripdir:-/usr/local/scripts/}"
files="${files:-    }"

# stop me before it gets ugly
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }

cp $files $scriptdir;

cat "cron-entry" >>/var/cron/tabs/root;

/etc/rc.d/cron restart;

echo "The scripts were installed `ls -alhF /usr/local/scripts`";

echo "The cron entry was added `grep build_all.sh /var/cron/tabs/root`";

echo "html files should begin to populae /var/www/htdocs/";

true
