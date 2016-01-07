class skype {
  apt::source { 'canonical-partner':
    location => 'http://archive.canonical.com/ubuntu',
    repos    => 'partner',
  } ->

  package { ['skype']: 
    ensure => 'installed'
  }

}
