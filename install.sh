#!/bin/bash

# bail out on any error
set -e

PUPPET_TARGET=all

# test for puppet
if dpkg -s puppet > /dev/null; then
   echo "Puppet already installed"
else
   echo "Installing puppet ..."
   sudo apt-get -y install puppet
fi

set -e
sudo FACTER_install_gitconfig=$gitconfig \
     FACTER_home=$HOME \
     FACTER_real_id=`whoami` \
     puppet apply --modulepath=modules -e "include $PUPPET_TARGET"
