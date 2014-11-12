# puppet-debianinstaller
Puppet Installer to one-step-execute the installation of puppet on debian system 

## This is how it works 
It downloads the debian-package from puppetlabs and installs it.
The rest is handled by puppetlabs fine debian-package 

## Use it like this
```
wget --no-check-certificate https://github.com/jmetzger/puppet-debianinstaller/raw/master/install-puppet.sh
./install-puppet.sh
```
## Oneline ;o 
```
wget --no-check-certificate https://github.com/jmetzger/puppet-debianinstaller/raw/master/install-puppet.sh -O - | /bin/bash 
```
