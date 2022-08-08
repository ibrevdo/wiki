# My Slackware setup

## Installation steps

**Step 1** mirror slackware tree according to a desired version:
```sh
./mirror-slackware-current.sh   -a x86_64 -r 14.2 -v -o NONE        \
                                -l ~/installs/slackware    \
                                -f -m rsync.slackware.pl::slackware/slackware64-14.2
```

**Step 2** prepare an install DVD image
`./make-slackware-dvd`

```sh
#!/bin/bash

SLACKWARE_TREE=./slackware64-14.2

cd $SLACKWARE_TREE

mkisofs -o ../slackware-dvd.iso                         \
        -R -J -A "Slackware Install"                    \
        -hide-rr-moved                                  \
        -v -d -N                                        \
        -no-emul-boot -boot-load-size 4 -boot-info-table \
        -sort isolinux/iso.sort                         \
        -b isolinux/isolinux.bin                        \
        -c isolinux/isolinux.boot                       \
        -m 'source'                                     \
        -V "SlackDVD" .
```
                  
                  
                  
**Step 3** Process the ISO image to make it bootable when written to a USB stick.
`isohybrid slackware-dvd.iso`


**Step 4** write ISO image to a USB stick
`dd if=slackware-dvd.iso of=/dev/sdX bs=1M`


## System configuration (Post install)

### Using initrd (Initial RAM disk)

**Step 1** make the initrd
```sh 
mkinitrd -c -k 4.14.11 -m ext4 -f ext4 -r /dev/sdb1
```


**Step 2** configure lilo.config to use it
```sh
# Linux bootable partition config begins
image = /boot/vmlinuz-generic
    root = /dev/sdb1
    label = "Linux"
    initrd = /boot/initrd.gz
    read-only
```
      
      
**Step 3** and run lilo (and reboot)
`lilo -v`
      
### Create user
1. TODO: adduser command, PATH variable
2. add user to sudoers file `EDITOR=vim visudo`:
`<username> ALL = (ALL) ALL `
     
     
### Restore system configuration files
TODO
     
### Install and configure slackpkgplus
TODO
     
### Install multilib
TODO
     
### Use slackbuilds to install packages
TODO
     
     
### Slackware update routine
     
**Step 1** Update packages
```sh
slackpkg update
slackpkg install-new
slackpkg upgrade-all
slackpkg clean-system (optional)
```

**Step 2** Deal with new files
```sh
find /etc -iname "*.new"
```

### Additional step when using initrd (Initial RAM disk)
make the initrd
```sh
VER=$(ls /boot | grep "vmlinuz-generic-" | cut -d'-' -f 3) && sudo mkinitrd -c -k $VER -m ext4 -f ext4 -r /dev/sdb1
```
and run lilo `lilo -v`

## Slackware Live CD 
#### How to chroot from live CD to original file system and install initrd on hard drive partition

```sh
mkdir /mnt/root
mount -t ext4 /dev/sdb1 /mnt/root
mount -t proc none /mnt/root/proc
mount -o bind /dev /mnt/root/dev
(mount -o bind /usr /mnt/root/usr)
chroot /mnt/root /bin/bash
```

And now make the initrd as described in __Using initrd__ above 


