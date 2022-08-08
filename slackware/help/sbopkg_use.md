## sbopkg use

1. run it as root `su -`

* `/var/lib/SBo`	local repo

### other options
* `sbopkg -r`				rsync local repo with SBo
* `sbopkg -s PACKAGE(s)`	search for specific package(s)
* `sbopkg -p`				list installed packages
* `sbopkg -pR`				as above but also view README of the packages
* `sbopkg -l`				display the SBo ChangeLog
* `sbopkg -c`				display a list of installed packages and potential updates
* `sbopkg -b PACKAGE(s)/QUEUE(s)`	build packages of the arguments
* `sbopkg -d PACKAGE(s)/QUEUE(s)`	download packages of the arguments
* `sbopkg -i PACKAGE(s)/QUEUE(s)`	downlad,build and install packages of the arguments

### sbo queues
* `sqg -p PACKAGE(s)`		creates queue file for individual package	
