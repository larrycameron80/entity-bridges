#!/bin/sh -x

credits="${credits:-/var/www/htdocs/credits.html}"

cat header >$credits;

echo "<h3>Credits</h3>" >>$credits;

echo "This project would not have been possible without the hardware
and software solutions provided by the following parties. Their active
or passive support is enormously appreciated." >>$credits;

echo "<p>" >>$credits;

echo "<li> flashrd http://www.nmedia.net/flashrd/ </li>" >>$credits;

echo "<li> The OpenBSD Project http://www.openbsd.org/ </li>" >>$credits;

echo "<li> PCEngines http://www.pcengines.ch/ </li>" >>$credits;

echo "<li> The Tor Project https://www.torproject.org/ </li>" >>$credits;

cat footer >>$credits;
