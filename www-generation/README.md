A set of scripts run on the Tor bridge to output a static web site for viewing on the local network.

The site is very basic and meant to give the end-user a sense of what the Tor bridge is doing, and some other basic information. The shell scripts are ugly, but sufficient for the purposes at the current phase. The scripts need more time to ensure their portability. A move to CSS for the web site should come at future stages.

The web site can be generated from cron(8) to provide the basic information about the Tor bridge to the user on the local network, with the following pages:

* a simple home page, with the bridge's public IP, listening port and hashed fingerprint, in addition to the bridge-stats

* an "About" page, providing a simple overview of the role of the bridge

* a "Help" page, providing basic troubleshooting information, and simple instructions on configuring Tor Browser for using this bridge

* "Credits" for the core projects utilized

* A "Tor Configuration" page displaying the system's torrc file

* "Current Logs" with the last twenty lines of output from the Tor and system logs


