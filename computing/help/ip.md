---
order: 1

---

IP
==========

Header
-----------


Version (4 bits) IHL (4 bits)   DSCP (6 bits) ECN (2 bits)  Total length (16 bits)
Identification (16 bits)                                Flags (3 bits)  Fragment offset (13 bits)
TTL (8 bits)                Protocol (8 bits)           Checksum (32 bits)
Source IP (32 bits)
Destination IP (32 bits)
Options (0-128 bits)

* Version = 4
* IHL (Internet header length) - number of 32 bit words (5 means 32*5 bits => 20 bytes)
* DSCP - TOS

