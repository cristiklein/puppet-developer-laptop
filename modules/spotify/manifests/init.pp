class spotify {

  apt::source { 'spotify':
    location => 'http://repository.spotify.com',
    release  => 'testing',
    repos    => 'non-free',
    key      => 'BBEBDCB318AD50EC6865090613B00F1FD2C19886',
  } ->

  # No clue why libgcrypt is not a dependency
  package { 'spotify-client': 
    ensure => 'installed'
  }

}
