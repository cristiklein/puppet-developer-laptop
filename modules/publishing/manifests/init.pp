class publishing {
  
  package { ['gimp', 'inkscape','texlive-full','unoconv']:
    ensure => 'installed'
  }

}
