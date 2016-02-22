class publishing {
  
  package { [
    'gimp',
    'inkscape',
    'pdftk',
    'texlive-full',
    'ttf-mscorefonts-installer',
    'unoconv',
  ]:
    ensure => 'installed'
  }

}
