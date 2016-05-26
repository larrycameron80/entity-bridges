#!/bin/sh -x

help="${help:-/var/www/htdocs/help.html}"
datadir="${datadir:-/var/tor/}"
fprint="${fprint:-`cut -d ' ' -f 2 $datadir/hashed-fingerprint`}"

cat header >$help;

echo "<h3>Help and Troubleshooting Information</h3>" >>$help;

echo "<b>How Does a Remote User Configure their Tor Browser to Use My Bridge?</b>" >>$help;

echo 'Right click on the green onion Tor icon, and select <i>Tor Network Settings</i>' >>$help;

echo "In the <i>Enter custom bridges</i> section, the remote user should enter <b>`dig +short myip.opendns.com @resolver1.opendns.com`:`grep ORPort /etc/tor/torrc | cut -d " " -f 2`</b>" >>$help;

echo "<p>" >>$help;

echo "<img src=tor-bridge-config.png alt="Tor Bridge Configuration" height="450" width="450">" >>$help;

echo "<p>" >>$help;

echo "<b>How can I check the public status of my bridge?</b>" >>$help;

echo "Tor's <a href="https://atlas.torproject.org/">Atlas</a> site provides information on all public nodes, including bridges. Click <a href="https://atlas.torproject.org/#details/$fprint">here</a> to view public information about your bridge." >>$help;

echo "<p>" >>$help;

echo "<b>My Bridge Usage Statistics Seem Old</b>" >>$help;

echo "Bridge statistics are updated at 24 hour intervals." >>$help;

echo "A bridge that hasn't been operational for the first 24 hours" >>$help;

echo "will not indicate the current bridge usage statistics." >>$help;

echo "<p>" >>$help;

echo "<b>My Tor Bridge can't connect to the Tor network</b>" >>$help;

echo "It is possible that port forwarding isn't setup on your home router." >>$help;

echo "Your router needs to be configured to forward port `grep ORPort /etc/tor/torrc | cut -d " " -f 2` on the host `ifconfig | grep inet | grep 192 | cut -d " " -f 2`" >>$help;

echo "There are numerous guides on the internet which can assist you in configuring port forwarding." >>$help;

echo "Search for port forwarding for the specific router model you are using." >>$help;

echo "<p>" >>$help;

echo "<b>Common Tor Log Errors</b>" >>$help;

cat footer >>$help;
