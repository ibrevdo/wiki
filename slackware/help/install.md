
# Slackware install using usb drive 

[slackware](file:../../.html/slackware.html)

## Install using prepared iso file

1. download the iso from https://slackware.nl/slackware/slackware-iso/slackware64-15.0-iso/
`wget -c https://slackware.nl/slackware/slackware-iso/slackware64-15.0-iso/slackware64-15.0-install-dvd.iso`
2. copy the the iso file to usb drive 
`dd if=slackware64-15.0-install-dvd.iso of=/dev/sda`

### Install using slackware packages tree

* use `mirror-slackware-current.sh` to download slackware release
* as a result the slackware64-current dir is created.
* use a helper script ./slackware64-current/usb-and-pxe-installers/usbimg2disk.sh to create the iso and copy it to usb

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

## Installation notes

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

* so after the installation ended, stay in shell, and use following steps.
(based on otb video)
```
chroot /mnt /bin/bash
source /etc/profile
```

### Installing grub bootloader (optional)
* when using UEFI, it is recommended to skip the installation of lilo/elilo, and install grub instead.
```
grub-install --target=x86_64-efi --efi-directory=/boot/efi bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
```

### Adding user
* run `adduser` command to add non-root user
* add new user to wheel group
* set a new user with sudo permissions. run `visudo`
* in sudoers file uncomment a line to allow members of group wheel to execute any command


## Post installation steps

* These steps are performed after the reboot into new installed slackware
* And after enabling the network connection

### Time configuration
* If the time is not correct, run this command once: `ntpdate pool.ntp.org`
* In order to continuesly keep the clock synced, there are two optins: using ntp deamon, or calling ntpdate manually.
* currently I don't enable the ntpd service. instead the cron job calling the ntpdate command is used. Please see details in the note called time_and_clock.md, towards the end.

### packages configuration
* choose the mirror in `/etc/slackpg/mirrors`
* update the gpg keys `slackpkg update gpg`
* now the regular update cycle
```
slackpkg update
slackpkg install-new
slackpkg upgrade-all
```

### update the kernel to generic
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
