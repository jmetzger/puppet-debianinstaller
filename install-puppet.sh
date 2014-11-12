#!/bin/bash

if [ ! -f /etc/debian_version ]
then 
   echo "Sorry, this is no debian system. Giving up"
   exit;
fi

DEBIAN_VERSION=$(cat /etc/debian_version | cut -d"." -f 1)

case $DEBIAN_VERSION in
    6)  DEBIAN_RELEASE="squeeze"
        ;;
    7)  DEBIAN_RELEASE="wheezy"
       ;;
    8)  DEBIAN_RELEASE="jessie"
       ;;
esac 

if [ "$DEBIAN_VERSION" == "" ]
then 
   echo "Sorry, Debian Release for $DEBIAN_VERSION not detected. Eventually not implemented ?"
   exit;
fi 

RELEASE=$DEBIAN_RELEASE
PACKAGE=puppetlabs-release-$RELEASE.deb
INSTALLER=https://apt.puppetlabs.com/$PACKAGE

# This retrieves the correct mirror for puppet installs it
cd /usr/src
wget  $INSTALLER

if [ ! -f $PACKAGE ]
then
  echo "Something went wrong and puppet release was not donwloaded .. Giving up."
  exit
fi
  
dpkg -i $PACKAGE
apt-get update
apt-get install --assume-yes puppet
  