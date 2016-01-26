class kupfer {

  apt::source { 'kupfer-team-ubuntu-ppa-wily':
    ensure => 'absent',
  }

  apt::source { 'kupfer-team-ppa-saucy':
    ensure => 'absent',
  }

  package { 'kupfer' :
    ensure => 'purged',
  }
}
