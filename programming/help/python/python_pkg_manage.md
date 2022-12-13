# Python packages management

## pip
`pip3 --user install` - an easy way to find depencencies of a new module I want to package (from slackware user who builds python packages manually)

Another slackware user: "sometimes pip can overwrite some package from slackware or SBo, be careful". His approach:
* `pip3 --no-deps` - to install a package
* `pip3 check` - to check what packages are needed 
* `pip3 install <package> --no-deps --root=/<local path>` - this option can be used to install package under separate dir

Spyder - a python IDE. you can install it `pip3 install spyder` (will install more than 100 packages)

Another user has a generic pip SlackBuild:
<https://github.com/gwenhael-le-moine/slackbuilds/blob/master/generic-python.SlackBuild>
call it like:
`PRGNAM=smartypants /home/installs/SlackBuilds/generic-python.SlackBuild`

## Python virtual env

### conda
* a tool to create isolated enviromnet for Python libraries
* it's usually installed during the installation of either Anaconda or miniconda
* miniconda is Python + conda installation
* Anaconda is Python + conda + 3G of libraries for Data science preinstalled

Example:
```
conda crate -n python310_dev python=3.10
conda activate python310_dev
pip install -U black
black -t py310 --check check_prime_numbers.py
```

### virtualenv
* tool to create isolated environment for Python libraries
* It installs the libraries in a local directory and then modifying the `$PATH` environment variable to prefix with a custom `bin` directory
* The exact copy of python and python3 binary also placed in this dirctory
* Once activated you, can install packages in the virtual environment with `pip`

Example:
```
pip install virtualenv
mkdir environments; cd environments
virtualenv project1_env
source project1_env/bin/activate # the prompt is changed accordingly
which python
which pip
pip list
pip install numpy
pip install pytz
pip install psutil
pip list
pip freeze --local > requirements.txt   # save current packages list in a file
deactivate      # stop using the virtual env
rm -rf project1_env # get rid of the virtual env
```

Example cont:
```
1. virtualenv -p /usr/bin/python2.6 py26_env    # create enviroment with other version of python
2. source py26_env/bin/activate
3. pip install -r requirements.txt  # install here same packages
4. deactivate
```

### venv
* a package shipped with Python 3 as part of the standard library
* run it `python3 -m venv`
* it has a subset of features of the virtualenv

Example:
```
python3 -m venv project1_env
. project1_env/bin/activate
```
