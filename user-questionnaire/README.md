As each Tor bridge will reside on different local residential networks, relevant local area network information needs to be collected.

In the initial stages of this projects, this will be done with a simple questionnaire. In the future, certain aspects can be automated such as determining the appropriate Tor bandwidth restrictions.

Once resolved, the questionaire will only be necessary for the physical attributes of the bridge site.

The questionnaire questions can be eliminated when the following areas can be resolved by an automated one-time script:

* network section of the RFC1918 LAN address

* actual upload and download speeds of internet connection, from which Rate and Burst setting in torrc can be determined as a percentage

* enabling port forwarding from PublicIP:ORPort on WAN side to Tor bridge with something functionally similiar to UPnP


