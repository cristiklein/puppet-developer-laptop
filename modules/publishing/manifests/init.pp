class publishing {
  
  package { ['gimp', 'inkscape','texlive-full']:
    ensure => 'installed'
  }

}
