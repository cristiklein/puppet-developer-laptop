class ssh-server {
  
  package { ['openssh-server', 'fail2ban']: 
    ensure => 'installed'
  }

}
