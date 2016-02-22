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

  file { "${home}/.latexmkrc":
    ensure => present,
    source => "puppet:///modules/${module_name}/latexmkrc",
    owner  => $real_id,
    group  => $real_id,
  }

}
