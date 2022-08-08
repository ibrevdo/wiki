
## Regular upgrade

### Checking what's new
wget -O ChangeLog.txt https://mirrors.slackware.com/slackware/slackware64-current/ChangeLog.txt
vim /var/lib/slackpkg/ChangeLog.txt ChangeLog.txt

### log in as root
init 3

### update packages
slackpkg update

### install new packages
slackpkg install-new

### Upgrade all packages for Slackware
slackpkg -download_all=on upgrade-all

### upgrade latest google-chrome
cd ~/tools/scripts/; ./latest-chrome.sh -i


### if using grub
grub-mkconfig -o /boot/grub/grub.cfg


-----------------------------------------------------

## Questions and Answers

### List all installed packges
`ls -1 /var/log/packages | less`


### List all config files that saved as ".orig"
`sudo find /etc -type f -name '*.orig' -print`

delete these files
`sudo find /etc -type f -name '*.orig' -exec rm {} \;`

### find which file belongs to a package
Example: find all files from a package smplayer
`sudo vim /var/lib/pkgtools/packages/smplayer-19.10.2-x86_64-1_SBo`

### kernel upgrade

> I would highly recommend not to use slackpkg to upgrade your kernels, unless you have a very simple setup
> (using the huge kernel, no initrd, no LUKS/LVM/RAID)...

> I have the kernel-modules and kernel-generic blacklisted and manually 'installpkg' a new kernel alongside my running kernel.
> Then I create a new initrd to accompany the new kernel and its modules.
> Then I update (e)lilo and make sure that I can always boot the latest (new) kernel and the previous kernel.
> That way, I am sure that there will always be a kernel in the boot menu that I know is working.
> Finally I removepkg the oldest kernel (keeping two), its modules and its initrd.

* From here: <https://www.linuxquestions.org/questions/slackware-14/pam-slackware-current-login-problem-4175675753/>
