The hub server provides two core functions for Entity-Bridges:

1. securely distributing the flashrd update files with signature verification for the remote Tor bridges

2. providing basic unobstrusive monitoring and information about each Tor bridge

There will be a common restricted, read-only directory by which the bridges will check the current upgrade files, accessing over SSH with public/private key authentication.

There will also be chroot, read-write directories for each bridge to push relevant information.
