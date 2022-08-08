---
order: 2

---

IPSEC
=====================

IP sec - a protocol to secure IP layer packets. The securing is done by authentication and encryption of the IP packet

Security Arhictecture
---------------------

#### Authentication Header (AH)

Uses hash function and a shared secret key for connectionless data integrity.
Authenticates IP packets to gurantee data origin.

**Header format**
* Next header (8bits)   - type of IP protocol number of this IP packet
* Payload len (8 bits) - length of this header in 4-octet units, minus 2.
* Reserved (16 bits)
* SPI (Security parameter index) (32 bit)
* Sequence number (32 bit)
* ICV (Integrity check value) (multiple of 32 bit)


**Encapsulating Security Payload (ESP)**
* origin authenticity through source authentication
* data integrity through hash functions
* confidentiality through encryption protection
* uses IP protocol number 50

Packet format
* SPI (Security parameter index) (32 bit)
* Sequence number (32 bit)
* Payload data (variable) - protected contents of original IP packet
* Padding (0-255 octets) - padding for encryption, to extend the payload data to a size that fits the encryption's cipher block size, and to align the next field.
* Padding length (8 bits) - size of the padding
* Next header (8bits)   - type of IP protocol number of this IP packet
* ICV (Integrity check value) (multiple of 32 bit) - It may contain padding to align the field to an 8-octet boundary for IPv6, or a 4-octet boundary for IPv4.



#### Security Association (SA)

**Notes**
Mutable (and therefore unauthenticated) IPv4 header fields are:
DSCP/ToS,
ECN,
Flags,
Fragment Offset,
TTL
Header Checksum



Modes of Operation
-------------------------

#### Transpot mode

#### Tunnel mode



#### Links
<http://www.unixwiz.net/techtips/iguide-ipsec.html>


