
# Linux CLI examples

### Shell input/output redirection
1. How to redirect program output into screen and log file
    * `program <arguments> 2>&1 | tee out.log`

### find tricks

* find file by (partial) name   `find . -iname "stdio*" `
* count a number of files in directories recursively (wihtout folders)
	* `find . -type f | wc -l`
* update permissions to all folders recursively
	* `find . -type d -exec chmod 755 {} \;`
* update permissions to all files recursively
	* `find /opt/lampp/htdocs -type f -exec chmod 644 {} \;`
*  Calculate md5 checksum of a directory
	* `find "$path" -type f -print0 | sort -z | xargs -r0 md5sum | md5sum`

### grep
1. how to search more than one expression
    * `grep 'word1\|word2' /path/to/file`
2. search "word" in hidden directories   
	* ``grep -R "word" `ls -ap | grep "^\..*/$"``

## Logs

* dmesg                                 prints kernel messages . i.e `/var/log/kern.log`
* print 10 last lines of kernel log     `dmesg | tail 10`
* follow log file in real time          `tail -f /var/log/syslog`

## Networks

### tcpdump
* simple
    * `tcpdump -n -i eth0.100 udp src 10.0.2.15 and dst port 13001`
* check first byte of payload for value (opcode 101)
    * `tcpdump -nX -i lo udp src port 12000 and udp[8]==101`

### route
1. add a route to multicast network addr
    * `route add -net 224.0.0.0/3 eth0`
2. add default gw
    * `route add default gw 100.0.0.7`

### other
* display bandwidth usage               `iftop -P`


## Time sync
update time using time server on linux
* <http://www.cyberciti.biz/tips/synchronize-the-system-clock-to-network-time-protocol-ntp-under-fedora-or-red-hat-linux.html>
* <http://www.howtogeek.com/tips/how-to-sync-your-linux-server-time-with-network-time-servers-ntp/>

## media streaming

### mplayer stream
* `mplayer -afm ffmpeg -cache 5000000 -prefer-ipv4 https://kanlivep2event-i.akamaihd.net/hls/live/749624/749624/kanbet_mp3/chunklist.m3u8`
* `mplayer -afm ffmpeg -cache 5000000 https://82.102.152.41/hls/live/749624/749624/kanbet_mp3/chunklist.m3u8`
* `mplayer -afm ffmpeg -nocache -prefer-ipv4 https://kanlivep2event-i.akamaihd.net/hls/live/749624/749624/kanbet_mp3/chunklist.m3u8`

---
* how to download an MP3 track from a YouTube video
	* <https://askubuntu.com/questions/178481/how-to-download-an-mp3-track-from-a-youtube-video>

