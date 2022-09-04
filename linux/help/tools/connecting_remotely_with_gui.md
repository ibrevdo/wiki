# Connecting remotely with gui

## Introduction
The client side is simple: just use any vncviewer program to connect to server that running VNC.

The server can use 2 main strategies:
* Creating a new gui session for a user to login (classic vncserver like , TigerVNC)
* Sharing existing local login (x11vnc)

### Available VNC software:

**TigerVNC**, **RealVNC**, **TightVNC**, **UltraVNC** ...

On Slackware Linux i use : **TigerVNC** as server
(the package is in /extra. it installs server and viewer)

On Windows : **UltraVNC** portable client

## VNC Viewer
* `use <ip_address>:1 to connect to VNC server, display 1`
* on linux run `vncviewer` from terminal

## VNC Server

### installation and setup (for TigerVNC version 1.12)
* Update: I performed all following steps but there are some caviats:
	* The vncserver server can be start only by user that is not currently started desktop session
	* But when using Network manager, the network connection is on only after login in to gui
	* Other than this, I managed to get only xwindow when connecting. the whole plasma desktop was not working
	* That why I switched to use x11vnc as server
* Steps according to this article <https://alien.slackbook.org/blog/challenges-with-tigervnc-in-slackware-15-0/>
	* install fltk, tigervnc package from extra
	* create `/usr/local/sbin/vncsession-start`
	* create `/etc/sudoers.d/vncsession`
	* create a group `vnc` and add a local user to it
	```
	groupadd vnc
	gpasswd -a mago vnc
	```
	* update `/etc/tigervnc/vncserver.users` with that user+port
	* update `/etc/tigervnc/vncserver-config-defaults` with a wanted gui session
	* run vncpasswd to create a password that vnclient will be using for this user

### setup for TigerVNC version before 1.12
* <https://www.linuxquestions.org/questions/slackware-14/vnc-for-slackware-current-4175627970/>
* vncserver - a command that starts the VNC service
* On start it uses first available display number (usually :1) \\
  and then run ~/.vnc/xstartup script. 
* In my case xstartup points to ~/.xinitrc \\
  (which is not executable?? )             \\
  I updated xstartup script to :           \\
  `exec sh ~/.xinitrc`
* `vncserver -geometry 1920x1080`
* `vncpasswd` - a program that configures the login password that is entered by the viewer. \\
    The passwrd is stored in ~/.vnc/passwd
* killing VNC server : `vncserver -kill :1`

## Reusing physical display session (display:0)
### x0vncserver
* `x0vncserver` - this program enables to connect to VNC server on display 0
* `x0vncserver PasswordFile=~/.vnc/passwd`

### x11vnc (I use this eventually)
**x11vnc** - a program that enables to remotely connect to physical monitor
That way you can connect to a running session. Just like with x0vncserver

Setup (for plasma in Slackware 15)
* Note1: the following assumes the vnc password was created for a user.
* Note2: the idea here is that a user logs in locally once and then connects to this desktop session remotely
* install x11vnc package from slackbuilds
* create .desktop file `x11.desktop`
```
[Desktop Entry]
Exec=x1vnc -bg -shared -forever -usepw -o %%HOME/.x11vnc.log.%%VNCDISPLAY
Terminal=true
Type=Application
```
* Put the file in `~/.config/autostart` so the x11vnc will start when user logs in into gui
* from here: <https://www.linuxquestions.org/questions/slackware-14/launching-x11vnc-server-automatically-on-starting-an-xfce-session-4175710023/>


## Links
Some links about configuring VNC server on Slackware

* http://pmoghadam.com/homepage/HTML/slackware-13.37-tightvnc-epkg.html
* http://www.linuxquestions.org/questions/slackware-14/robust-vncserver-startup-file-rc-vncserver-248779/



