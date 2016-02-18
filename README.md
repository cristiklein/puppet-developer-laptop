# Puppet config for Cristian Klein

This is how I configure my desktops and laptops after installing a vanilla Ubuntu 15.10. Some parts of the repository are encrypted and unaccessible to the public. However, I hope that by sharing this repository with the world, others will be able to embrace the _stateless desktop/laptop_ concept too.

## Usage

1. Brainless

        curl https://raw.githubusercontent.com/cristiklein/puppet-developer-laptop/master/provision | bash

2. Advanced / Development

        sudo apt-get install git git-crypt
        git clone --recursive git@github.com:cristiklein/puppet-developer-laptop.git
        git-crypt unlock
        ./install.sh
