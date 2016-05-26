#!/bin/sh -x

logs="${credits:-/var/www/htdocs/logs.html}"
logdir="${logdir:-/var/log}"

cat header >$logs;

echo "<h3>Log Information</h3>" >>$logs;

echo "These are the system's log file which may be useful for troubleshooting any issues related to your Tor bridge." >>$logs;

# reverse display of tor.log and messages from /var/log
echo "<h4>Current Tor Log Information</h4>" >>$logs;

tail -r -n 20 $logdir/tor.log >>$logs;

echo "<hr>" >>$logs;

echo "<h4>Current System Log Information</h4>" >>$logs;

tail -r -n 20 $logdir/messages >>$logs;

cat footer >>$logs;
