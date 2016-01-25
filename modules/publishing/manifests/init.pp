class publishing {
  
  package { ['gimp', 'inkscape','pdftk','texlive-full','unoconv']:
    ensure => 'installed'
  }

}
