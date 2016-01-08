class dictionaries {

  package { [
      'myspell-de-de',
      'myspell-en-gb',
      'myspell-fr',
      'hunspell-ro',
      'hunspell-sv-se',
    ]:
    ensure => 'installed'
  }

  package { [
      'myspell-en-au',
      'myspell-en-za',
    ]:
    ensure => 'absent'
  }
}
