#!/bin/sh -x

torrc="${credits:-/var/www/htdocs/torrc.html}"

cat header >$torrc;

echo "<h3>Tor Configuration</h3>" >>$torrc;

cat /etc/tor/torrc >>$torrc;

cat footer >>$torrc;
