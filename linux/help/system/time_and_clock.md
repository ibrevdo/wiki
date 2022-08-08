---
order: 5
---
# Time and Clock

## Hardware clock and System clock
**Hardware clock** (BIOS CLOCK, RTC) is a CMOS watch backed by battery.             \\
During boot, Linux sets it's system clock according to the hardware clock using \\
`hwclock -s (--hctosys)`

On shutdown Linux writes it current system clock value to hardware clock using  \\
`hwclock -w (--systohc)`                                                        \\
(This command also updates timestamps in /etc/adjtime)

Check the HW clock time:`hwclock -r`

**System clock** (software clock, CPU clock) is used by kernel and all applications \\
while the Linux is running. The commands that effect the system clock are : \\
date, ntpdate, ntpd, and system calls: settimeofday(), adjtime().

* `date -s <current date>` is used for setting current time and date by user.
* `ntpdate <ntp server>` starts NTP protocol with the given server 
  and updates System clock according to it. `ntpdate pool.ntp.org`
* **ntpd** - is NTP service that runs constantly and periodically updates System clock. \\
  It also updates HW clock every 11 minutes acording to System clock. \\
  Another service it provides, is acting as NTP server for a local network \\
  listening on port 123 for other computers requests.
* Note: ntpd can run for only single fix if given a flag -q \\
  (in that way it works as ntpdate exactly) ntpd uses config file: `/etc/ntp.conf`

## Time Zones
The system clock has Time Zone (TZ) information and Daylight Saving Time (DST) information.\\
The hardware clock on the other hand, can only hold date and time.\\
So when system time is saved into HW clock there are two options :
* UTC - means that the time that is saved is UTC time
* LOCAL - means that the time that is saved is Local time (accrding to TZ and DST)
* `/etc/adjtime` holds the current configuration of the HW clock.
* `/usr/share/zoneinfo/` is a system timezone database. It is updated as part of glibc-zoneinfo package.
* `/etc/localtime` - contains current TZ and DST info. (The file from zoneinfo is copied here.)

**Example**:

```sh
IST-2IDT,M3.4.4/26,M10.5.0
It means that we use IST(Israel standard time) which is 2 hours ahead of UTC.
IDT is day saving time - without offset it is by default one hour ahead of standard time.
M3.4.4/26 - means the daylight saving starts on month 3, week 4 and day 4 of the week.
M10.5.0 - means the daylight saving stops on month 10, week 5, day 0 of the week.
```

Also we can use this command to show it easier:
`zdump -v Asia/Jerusalem | grep 2019`

From here : `man 3 tzset`

Note: The NTP protocol doesn't know anything about TZ/DST. It works with UTC time only.\\
When the time correction is made on the client, than the TZ/DST takes the effect.

## HW clock : LOCAL vs UTC
On computer that run by Linux it makes sense to sync HW clock with UTC time.\\
During the boot, the Linux will read UTC time from HW clock, will update the time with local TZ/DST\\
offset and will init the system clock with it. On shutdown the Linux will convert local system time to UTC\\
and will save it into RTC.\\
On a dual boot with Windows, there may be conflict with this approach,\\
as Windows tries to update HW clock with Local time (unless this feature is disabled)\\

If HW clock configured to hold Local time, then during the boot Linux will read the time from it
and will set System clock directly with that time.

What happens when Daylight saving is switched on/off ?\\
If the Linux is on, it will update it's system clock accordingly to the change, and will later save the change on RTC during shutdown.\\
But if the Linux is off, it will not happen and HW clock will still have the Local time before the switch and so will the system clock. (Because it reads the time directly from HW clock)\\
So, now in order to update the Local time we should use:\\
`ntpdate pool.ntp.org`


## Links
* man 8 hwclock
* man 3 tzset
* https://docs.slackware.com/howtos:hardware:syncing_hardware_clock_and_system_local_time
* https://docs.slackware.com/howtos:network_services:ntp
* https://wiki.archlinux.org/index.php/Network_Time_Protocol_daemon
* https://www.ntppool.org/en/use.html


## My configuration for Slackware
Use ntpdate command to update clock once a day

Create /etc/cron.dayly/datesync with following content:

```sh
#!/bin/sh
/usr/sbin/ntpdate 0.pool.ntp.org >> /var/log/messages 2>&1
/usr/sbin/ntpdate 1.pool.ntp.org >> /var/log/messages 2>&1
sleep 10
/sbin/hwclock -w
```

Enable the script for running
`chmod +x /etc/cron.daily/datesync`


