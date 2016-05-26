#!/bin/sh -x

index="${index:-/var/www/htdocs/index.html}"
tordata="${tordata:-/var/tor}"
torrc="${torrc:-/etc/tor/torrc}"

cat header >$index;

# display the bridge information for remote users
echo "<h3>Public IP Address and Port for Remote Bridge Users: `dig +short myip.opendns.com @resolver1.opendns.com`:`grep ORPort $torrc | cut -d " " -f 2`</h3>" >>$index;

# check status of the Tor daemon.  Need to clean up
echo '<data-toggle="tooltip" title="Is Tor Running?">Tor appears to be running</a>' >>$index;

# display uptime information
echo "<data-toggle='tooltip' title='System time and uptime'><b>The time is</b> `uptime | cut -d "," -f 1-2`</a>" >>$index;

# display the NickName and hashed fingerprint for verification
echo "<b>Bridge Name and Fingerprint</b> `cat $tordata/hashed-fingerprint`" >>$index;

# display the Tor version
echo "<b>Tor version is</b> `pkg_info -q | grep tor-0`" >>$index;

# display the system version
echo "<b>This build version is</b> `grep OpenBSD /var/run/dmesg.boot`" >>$index;

echo "<hr>" >>$index;

# display the bridge-stats.  Need to clean up
echo "<h4>Bridge Users by Country Code as of `grep bridge-stats-end $tordata/stats/bridge-stats | cut -d " " -f 2,3`</h4>" >>$index;

# add a lookup to translate 2-digit country code to full name
grep bridge-ips $tordata/stats/bridge-stats | cut -d " " -f 2 >>$index;

cat footer >>$index;
