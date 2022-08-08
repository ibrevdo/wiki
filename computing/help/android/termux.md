# Termux on android
## installation
1. I installed f-droid app store (downloaded apk) and excluded it from battery savings
2. Installed the termux through f-droid
3. Update the packages. `pkg update` and `pkg upgrade`
5. A couple of more links
    * https://f-droid.org/en/packages/com.termux/
    * https://github.com/termux/termux-app
    * https://wiki.termux.com/wiki/FAQ
    * https://wiki.termux.com/wiki/Differences_from_Linux
    * https://wiki.termux.com/wiki/Package_Management

## run ssh server on termux in order to transfer files to android
1. Enabled using phone storage by termux: `termux-setup-storage`
    * According to this link: https://wiki.termux.com/wiki/Internal_and_external_storage
2. install openssh: `pkg install openssh`
3. define a password for local termux user:
```
whoami -> u0_a465
passwd -> define new password for this user
sshd -> run ssh server
ifconfig -> look for wifi ip of android
```
4. connect to android from linux:
` ssh -p8022 u0_a465@192.168.0.102`
5. copy files using scp:
`scp -P8022 some_files u0_a465@192.168.0.102:~/storage/shared/`
6. According to this tutorial:
    * [install ssh server in termux, file transfer using scp over wifi](https://www.youtube.com/watch?v=EvSHx2MdyeY)
7. trnsfer file using rsync:
    * install rsync `pkg install rsync`
    * transfer files with following command:
`rsync -rvz -e 'ssh -p 8022' --progress some_files u0_a465@192.168.0.102:~/storage/shared/Igor_data/video/`
