#!/bin/bash

## Wrapper around `puppet module` to ensure repository-local modules are touched.

# bail out on any error
set -e

# test for puppet
if dpkg -s puppet &> /dev/null; then
  echo "Puppet already installed"
else
  echo "Installing puppet ..."
  sudo apt-get -y install puppet
fi

if [ $# -eq 0 ]; then
  exec puppet help module
else
  exec puppet module --modulepath=modules $*
fi
