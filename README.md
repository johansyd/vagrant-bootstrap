# vagrant-bootstrap
A skeleton repository for previewing vagrant provisioning and bootstrapping  by the Rude Booter.

## Installation

### Dependencies for Windows

Recommended:

- Install [babun](http://babun.github.io/)

Required:

NB: Comes preinstalled with most systems including [babun](http://babun.github.io/)

- Install [Python](https://www.python.org/downloads/release/python-2713/)

### Install Mac/Ubuntu/(Windows with Cygwin)

If you are using cygwin. Please install babun, open File Explorer, right click and choose: "open babun here"

    bash <(\curl -s "https://raw.githubusercontent.com/johansyd/rude-booter/master/scripts/install.sh")
    
 If you can not get access to the box from windows after following the installation, do the following:

Edit (as admin): C:\Windows\System32\drivers\etc\hosts
Make sure your host file has the following lines:

    192.168.77.22  vhost.vagrant.domain.com  # VAGRANT
    192.168.77.23  mysql.vagrant.domain.com  # VAGRANT
