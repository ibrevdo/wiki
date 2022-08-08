
# Liveslak

## Downloading
`rsync -avP rsync://bear.alienbase.nl/mirrors/slackware-live/1.3.4/slackware64-live-plasma5-current.iso .`

## Transfer to USB

* Create a persistent USB with following command. The changes will be written to the directory “persistence” in the root of the USB device
`iso2usb.sh -i slackware64-live-xfce-current.iso -o /dev/sdX`
* Create a persistent USB with encrypted /home directory. The "slhome.img" will hold the encrypted /home directory. It's size is 60% percent of USB volume.
`iso2usb.sh -i slackware64-live-xfce-current.iso -o /dev/sdX -c 60%`
* Create a persistent USB with following command. A file “persistence.img” in the root of the USB device will be loop-mounted by the Live OS and changes to the system will be written to the filesystem inside this container file.
`iso2usb.sh -P -i slackware64-live-xfce-current.iso -o /dev/sdX`
* Same but the “persistence.img” file will be encrypted. In this case, must provide a size of this container file
`iso2usb.sh -C 300M -i slackware64-live-xfce-current.iso -o /dev/sdX`

## Layout of the ISO 
* EFI   - grub configuration used when booting with UEFI
* boot  - syslinux configuration used when booting with BIOS. also contains the kernel and initrd files to actually boot the OS.
* liveslak - directory which contains all the squashfs modules which are used to assemble the filesystem of the Live OS.
  It also also contains the files that are copied directly into the root of the Live filesystem.
  * system - this directory contains all the modules which were created by the “make_slackware_live.sh” script. All these modules are numbered and the Live init script will use that to re-assemble the Live filesystem in the exact same order as they were created initially.
  * rootcopy/ - this directory is empty by default. Anything you (the user of the ISO) add to this directory will be copied verbatim into the filesystem by the init script when the Live OS boots. You can use this feature for instance if you do not want to create a separate squashfs module file for your application configuration files.
  * addons - modules which are stored in this directory will always be added to the Live filesystem
  * optional - modules in this directory will not be added to the filesystem of the Live OS unless you force this with a “load=” boot parameter
* persistent - the files of persistent overlay
* slhome.img - a file that contains an encrypted home dir

 * The boot command parameter to wipe the overlay and start with a fresh unaltered Live OS is `nop=wipe`
 * `mount -o remount,rw /mnt/livemedia` will remount the liveslak partition. For example, the persistent dir will be accessable as `/mnt/livemedia/persistence`
 * The complete RAM filesystem which underpins the overlay is made available to the user of the Live OS as `/mnt/live`
