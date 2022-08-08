# Debian help

### Use aptitude to install locally saved packages

1. The install command `aptitude install package-name` will put the package in this location:
    * `/var/cache/apt/archives/`
2. On offline computer, in order to install the package, run:
    * `dpkg -i package-file.deb`
3. Also it is possible to set up a local repo on offline computer:
    * `mkdir /location/debs`
    * `cp package-file.deb /location/debs`
    * `dpkg-scanpackages /location/debs /dev/null | gzip > /location/debs/Packages.gz`
4. And then add to sources list:
    * `deb file:/location debs/`
5. From here:
    * <https://www.linuxquestions.org/questions/linux-newbie-8/possible-to-use-aptitude-to-install-a-deb-not-in-a-repository-752706/>
    * <http://www.debian.org/doc/manuals/apt-howto/ch-basico.en.html#s-dpkg-scanpackages>

### add shared library (.so) to be avaliable on system-wide level
1. create a new file named igor.conf in /etc/ld.so.conf.d/
2. edit this file and add a line which is a path to `*.so` files.
	* example: `/home/rdev/.local/vccs/lib/`
	* copy to this location a neede so. (codec2.so.0.8)
3. reload the list of system-wide library paths: `sudo ldconfig`
4. see the system libs by running verbose mode: `ldconfig -v`

### install qt-creator from repo

1. aptitude install qtcreator
```
The following NEW packages will be installed:
libbotan-2-9{a} libclang1-7{a} libllvm7{a} libqbscore1.12{a} libqbsqtprofilesetup1.12{a}
libqt5designercomponents5{a} libtspi1{a} qbs-common{a} qtcreator qtcreator-data{a}
The following packages are RECOMMENDED but will NOT be installed:
clang qmlscene qmlscene:i386 qt5-doc qt5-qmltooling-plugins qtbase5-dev-tools qtbase5-dev-tools:i386
qtcreator-doc qtdeclarative5-dev-tools qtdeclarative5-dev-tools:i386 qttools5-dev-tools qttools5-dev-tools:i386
qtxmlpatterns5-dev-tools qtxmlpatterns5-dev-tools:i386
0 packages upgraded, 10 newly installed, 0 to remove and 0 not upgraded.
Need to get 41.2 MB of archives. After unpacking 182 MB will be used.
```
2. => installed version 4.8 :(

