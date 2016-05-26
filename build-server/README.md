This document elaborates on the necessary components for a build server for creating and updating flashrd images.

1.  Operating System: the version and architecture of OpenBSD matching the hardware utilized for the Tor bridges. In our case, we are opting for i386 OpenBSD -stable, as the six month release schedule is a reasonable interval for upgrades.

2.  flashrd: a clone of the flashrd source from Chris Cappuccio's https://github.com/yellowman/flashrd/.

3.  The relevant install tgz files from the OpenBSD version chosen in 1.

4.  A build script for the image creation and future updates. User-relevant varialbes (such as IP address scheme, etc.) are pulled from flat files, although this can be scaled to a simple database.
