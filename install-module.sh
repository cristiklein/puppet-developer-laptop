#!/bin/bash

# bail out on any error
set -e

# test for puppet
if dpkg -s puppet &> /dev/null; then
   echo "Puppet already installed"
else
   echo "Installing puppet ..."
   sudo apt-get -y install puppet
fi

puppet module --modulepath=modules install $*
