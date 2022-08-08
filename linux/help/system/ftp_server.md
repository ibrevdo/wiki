# FTP Server

## Configuration
* In slackware there two ftp servers preinstalled: vsftpd and proftpd
* The ftp service in slackware is run by rc.inetd script. In inetd configuration file `/etc/inetd.conf` uncomment following line
in order to start the ftp service.

```sh
ftp     stream  tcp     nowait  root    /usr/sbin/tcpd  proftpd
```
* Proftpd configuration is here `/etc/proftpd.conf`
* Inside ftp user home dir  `/home/ftp` create directory `incoming` and make it 777 permissions
* Restart inetd service: `rc.d/rc.inetd restart`
