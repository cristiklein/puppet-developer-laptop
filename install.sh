#!/bin/bash

# bail out on any error
set -e

# test for puppet
if dpkg -s puppet 2> /dev/null; then
   echo "Puppet already installed"
else
   echo "Installing puppet ..."
   sudo apt-get -y install puppet
fi

set -e
sudo FACTER_install_gitconfig=$gitconfig \
     FACTER_home=$HOME \
     FACTER_real_id=`whoami` \
     puppet apply --modulepath=modules environments/default.pp
