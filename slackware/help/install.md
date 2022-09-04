
# Slackware install using usb drive 

## Install steps

1. prepare usb drive with requested installation media (stable vs current) (details below)
2. boot from the usb drive (enter to BIOS of computer, and select USB as first boot option)
3. run **cfdisk** to prepare the linux partioins for the installation (a partion for /(root) and, optionally, for /home or swap partion)
4. select the /(root) partion as bootable
5. run **setup**
6. continue to **post setup steps** down below

### Prepare install usb with stable version using prepared iso file

1. download the iso from https://slackware.nl/slackware/slackware-iso/slackware64-15.0-iso/
`wget -c https://slackware.nl/slackware/slackware-iso/slackware64-15.0-iso/slackware64-15.0-install-dvd.iso`
2. copy the the iso file to usb drive 
`dd if=slackware64-15.0-install-dvd.iso of=/dev/sda`

### Prepare install usb with slackware current packages tree

* use `mirror-slackware-current.sh` to download slackware release
* as a result the slackware64-current dir is created.
* use a helper script ./slackware64-current/usb-and-pxe-installers/usbimg2disk.sh to create the iso and copy it to usb

## Installation notes

### Related links
* Most simple howto, which explains the first method
  * <https://www.slackwiki.com/Install_Slackware_Using_A_USB_Flash_Drive>
* this howto explains how to use the second way:
  * <https://medium.com/netdef/using-a-usb-stick-to-install-slackware-current-4b1051f1eb56>
* the alien bob post, introducing mirror-slackware-current.sh script
  * <https://alien.slackbook.org/blog/local-slackware-mirror/>
* general article about slackware [installation](https://docs.slackware.com/slackware:install)
* installing on [UEFI hardware](http://docs.slackware.com/howtos:slackware_admin:installing_on_uefi_hardware)
* OldTechBloke video on [installing slackware 15](https://www.youtube.com/watch?v=0yoP9xnh4jI)
* OldTechBloke video on [swap](https://www.youtube.com/watch?v=MAy4-3ppj6Y)

### UEFI, GPT, MBR ..
* The legacy partioning scheme is MBR (aka DOS)
* fdisk or cfdisk tools are used to manage MBR partioning
* UEFI machines always use GPT partitioning
* gdisk or cgdisk tools are used to manage GPT partioning
* when using UEFI, first partion on HDD is UEFI partion

### Swap partition
* the swap partition is used when the system low on memory or when hibernating
* if the hibernation is enabled then the swap size should be equal or more than RAM size
* the swap partion and other partions can be created with fdisk or cfdisk commands
* after creating swap partion with fdisk, there is a need to activate it with 2 commands:
```
mkswap /dev/sdX (format the swap partition)
sync
swapon /dev/sdX (activate the swap partion)
```
* The swap level is used to decide how frequent is swaping.
It is number 0-100. smaller number is less swap.
The less swap supposed to safe the ssd. Default value is 60
```
/etc/sysctl.d/99.swappiness.conf
vm.swappiness=10
```

## Post setup steps

1. So after the installation ended, stay in shell, and use following steps.
(based on otb video)
```
chroot /mnt /bin/bash
source /etc/profile
```

2. Installing grub bootloader (optional)
	* when using UEFI, it is recommended to skip the installation of lilo/elilo, and install grub instead.
```
grub-install --target=x86_64-efi --efi-directory=/boot/efi bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
```

3. Adding user
	* run `adduser` command to add non-root user
	* add new user to wheel group
	* set a new user with sudo permissions. run `visudo`
	* in sudoers file uncomment a line to allow members of group wheel to execute any command

4. Reboot
	* Remove the USB drive. 
	* restart with `reboot -f`
	* continue with **Post installation steps**


## Post installation steps

* First login
	* login into terminal emulator with a non-root user created earlier
	* run `startx` in order to login into GUI environment
	* enable the network connection with Network Manager
	* Note: if working with KDE, then choose blowfish encryption wallet and leave blank password.
	* Update power saving settings and lockscreen timeouts

* configuration files
	* copy .ssh/ keys from another computer
	* clone `config` repo `git clone git@github.com:ibrevdo/config.git`
	* run `create_links.sh` script to update configuration files: `.profile`, `.bashrc`, `.vimrc` for root and user

* to login straight into GUI session manager, update default runlevel to 4 in `/etc/inittab` 
(after this I needed to shutdown the computer to take effect)

* if using `lilo` boot loader, update the timeout in this file:
`/etc/lilo.conf` and run `lilo`

* packages configuration
	* choose the mirror in `/etc/slackpkg/mirrors`
	* update the gpg keys `slackpkg update gpg`
	* now the regular update cycle
```
slackpkg update
slackpkg install-new
slackpkg upgrade-all
```

* install bash-completion from extra

* install slackpg+
	1. download from <https://slackfinder.org/slackpkg+.html>
	2. install with `installpkg`
	3. edit `/etc/slackpkg/slackpkgplus.conf`
	4. run `slackpkg update gpg`

* install libreoffice + languages from alien bob repo

* install sbopkg from <https://sbopkg.org>
	* run it as root `su -`
	* rsync local repo with SBo `sbopkg -r`
	* install smplayer (as example) : `sbopkg -i smplayer`

* Time configuration (optional)
	* If the time is not correct, run this command once: `ntpdate pool.ntp.org`
	* In order to continuesly keep the clock synced, there are two options: using ntp deamon, or calling ntpdate manually.
	* currently I don't enable the ntpd service. instead the cron job calling the ntpdate command is used. Please see details in the note called time_and_clock.md, towards the end.

* update the kernel to generic (optional)
	1. create the generic kernel
		* there is a new command called `geninitrd`
		* also there is tui tool `pkgtool` and inside the menu choose setup->01.mkinitrd
	2. update the boot loader
		* if using grub, run `grub-mkconfig -o /boot/grub/grub.cfg`
		* still if using grub, update the default boot entry
```
vim /etc/default/grub
on the line GRUB_DEFAULT=...
update to "1" (advanced menu) and then to a line number that has "linux generic kernel"
GRUB_DEFAULT="1>6"
```

