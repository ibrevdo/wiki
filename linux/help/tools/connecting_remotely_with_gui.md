# Connecting remotely with gui

## Available VNC software:

**RealVNC**, **TightVNC**, **UltraVNC** ...

On Linux i use : **TigerVNC** as server

On Windows : **UltraVNC** portable client

## VNC Viewer
`use <ip_address>:1 to connect to VNC server, display 1`

## VNC Server
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

## Connecting to display:0
* `x0vncserver` - this program enables to connect to VNC server on display 0
* `x0vncserver PasswordFile=~/.vnc/passwd`


## X11VNC
* **x11vnc** - a program that enables to remotely connect to physical monitor
* That way you can connect to a running session. Just like with x0vncserver


### Links
Some links about configuring VNC server on Slackware

* http://pmoghadam.com/homepage/HTML/slackware-13.37-tightvnc-epkg.html
* http://www.linuxquestions.org/questions/slackware-14/robust-vncserver-startup-file-rc-vncserver-248779/



