#!/bin/sh -x

about="${about:-/var/www/htdocs/about.html}"

cat header >$about;

echo "<h3>About this Project</h3>" >>$about;

echo "This Tor bridge is a quiet, low-power, small form-factor server providing access to those with censored internet connections to the Tor anonymity network." >>$about;

echo "<p>" >>$about;

echo "You are playing a small but critical role in an effort to assist users in censored nation-states in accessing the public internet." >>$about;

echo "<p>" >>$about;

echo "Your support is greatly appreciated." >>$about;

echo "<hr>" >>$about;

cat footer >>$about;
