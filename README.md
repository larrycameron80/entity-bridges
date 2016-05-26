Entity-Bridges aims at building an infrastructure to configure, distribute and maintain a network of Tor bridges in the context of a single entity.

The assumed scenario is that you have an entity interested in extending the Tor network with a staff will to donate their underutilized bandwidth, with a technical staff capable of building the images, distributing them and upgrading them as necessary.

The system runs a [Tor bridge](https://www.torproject.org/) on the [OpenBSD](http://www.openbsd.org) operating system customized for embedded hardware with [flashrd](http://www.nmedia.net/flashrd). [Alix 3d2 boards](http://pcengines.ch/alix3d2.htm) from [PCEngines](http://pcengines.ch) is the initial target platform. The present preferred architecture is 32-bit i386, as both the platform is mature and a variety of inexpensive and depreciating boards are available.

The core software components include:

* a user questionnaire for acquiring the details necessary for Tor bridge config
uration, with some questions to be deprecated as the answers are automated

* [flashrd](http://www.nmedia.net/flashrd/)

* [custom flashrd build scripts](build-scripts/)

* static web page generator for local statistics to be run on the Tor bridge, providing the local network user basic information about bridge usage, status, and so on

* a hub server for monitoring the Tor bridges and for distributing system updates

This project is in its very early days with a number of critical components still in the brainstorm stage.
