class skype {
  package { ['skype']: 
    ensure => 'purged'
  }

  package { ['skypeforlinux']: 
    ensure => 'installed'
  }

  file { "${home}/.Skype":
    ensure  => 'absent',
    recurse => true,
    force   => true,
  }
}
