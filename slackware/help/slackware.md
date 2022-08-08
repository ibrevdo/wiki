# Slackware

### Slackware init
Slackware Linux uses the BSD-style file layout for its system initialization files.
All of the system initialization files are stored in the `/etc/rc.d` directory.

0. The system boot starts with Linux kernel, which calls for `/sbin/init` program
1. `init` reads an /etc/inittab configuration file to see how to run the system
2. First it runs `/etc/rc.d/rc.S` "startup" script which prepares the system before going to desired runlevel
    * enables virutal memory
    * mounts filesystems (by running rc.acpid)
    * cleans up logs dirs
    * initializes plug and play devices (by running rc.hotplug)
    * loads kernel modules - network card, PPP support - (by running rc.modules) (rc.modules will run rc.netdevice if exists)
    * configures PCMCIA devices (by running rc.pcmcia)
    * sets up serial ports (by running rc.serial)
    * runs Sys V init scripts (if found) (by running rc.sysvinit)

After system initialization is complete, `init` moves on to runlevel initialization. A runlevel describes the state that the machine will be running in. The files below define the different runlevels in Slackware Linux.

3. Runlevels
    * rc.0  - halt the system (runlevel 0) (same as rc.6)
    * rc.4  - multiuser startup (runlevel 4). Also starts X11 with KDM, GDM, or XDM as login manager
    * rc.6  - reboot the system (runlevel 6).
    * rc.K  - startup in single user mode (runlevel 1).
    * rc.M  - multiuser mode (runlevel 2 and 3) with standard text-based login.

The following files are responsible for the network init.

4. Network initialization
    * `rc.inetd`        Starts up inetd, the BSD Internet super-daemon.
    * `rc.inet1`        This script is used to bring up the various network interfaces.
    * `rc.inet1.conf`   Modified by netconfig, this file is responsible for configuring the actual network interfaces.
    * `rc.ip_forward`   Activates IP packet forwarding.
    * `rc.inet2`        Runs after rc.inet1 and starts up basic network services.
    * `rc.wireless`     This script sets up PCI, USB, and 32-bit Cardbus wireless devices
    * `rc.wireless.conf` Wireless LAN adapter configuration.
    * `rc.httpd`        Starts up the Apache web server.
    * `rc.mysqld`       Starts up the MySQL server.
    * `rc.nfsd`         Starts up the NFS server.
    * `rc.samba`        Starts up Windows file and print sharing services.
    * `rc.sshd`         Starts up the secure shell server (sshd).

### Slackware packages tools

* Official
    * installpkg    - a basic command to install slackware package. Used by other tools
    * slackpkg      - a standard tool to install packages from an official repository
    * an official repository to use: `/etc/slackpkg/mirrors`
    * list of installed packages: `/var/log/packages`

* slackpkgplus  - a plugin for slackpkg that alows to install packages from additional repositories as well
    * configuration file: `etc/slackpkg/slackpkgplus.conf`

* sbopkg        - a non official tool that allows installing packages from SlackBuilds
    * list of installed packages: `/var/log/sbopkg`

* sbotools - a set of cli tools that can install packages, manage their dependencies too

### bash_completion
* a package is in extra
* `/etc/bash_completion.d/` is used for for a user to add completions
* `/etc/profile` is read during user login, this script is running `/etc/profile.d/bash_completion.sh`,
which sources the `/usr/share/bash-completion`
* it is possibe to define completions functions in `~/.bash_completion` file also.
* example here <https://www.slackwiki.com/Bash_Autocompletion>
* to see a list of commands that have a completion: `complete -p | sed -e's/.* \([^ ]\+\)/\1/' | sort | less`


### Networking
* the network manager configuration
`/etc/NetworkManager/conf.d/00-dhcp-client.conf`

<https://www.linuxquestions.org/questions/slackware-14/upgradepkg-installpkg-and-system-integrity-4175622115/>


