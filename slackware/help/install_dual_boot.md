# Howto on installing slackware dual boot with windows

the howto was prepared according to <https://www.youtube.com/watch?v=kBIWSEoWIkw> video.

0. Prepare bootable USB with slackware install ISO
1. While in windows, prepare spare empty space for linux partion
2. Reboot the computer, and choose EFI boot from USB with slackware install
3. run gdisk and create an linux partion on empty space (also it is possible to create swap partion)
4. run `setup` to start the installation
5. skip installing lilo, install elilo
6. add an efi boot menu entry for slackware
7. reboot
8. after the reboot, enter the terminal and remove the elilo.
```rm -fr /boot/efi/EFI/Slackware
```
9. Now install grub
```
mkdir /boot/grub
grub-mkconfig -o /boot/grub/grub.cfg
grub-install /dev/sda
ls /boot/efi/EFI/slackware-15.0/ (shoud show grubx64.efi)
```
10. add an entry for windows boot manager `vim /boot/grub/grub.cfg`
```
after a line ### END /etc/grub.d/30_os prober ###
add folowing entry
menuentry "Windows 10" {
   set root='hd0,gpt2' 
   chainloader /EFI/Microsoft/Boot/bootmgfw.efi
   boot
}
gpt2-> Here 2 is the partion number of the EFI partion.
It may be different for your computer. You can verify that by typing the command:
gdisk -l /dev/sda
```
11. now reboot and boot entry for slackware and windows shoud be there
