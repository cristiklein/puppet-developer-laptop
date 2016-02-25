class publishing {

  exec { 'accept-msttf-license':
    command    => '/bin/echo /usr/bin/debconf msttcorefonts/accepted-mscorefonts-eula select true | sudo /usr/bin/debconf-set-selections;/bin/echo /usr/bin/debconf msttcorefonts/accepted-mscorefonts-eula seen true | sudo /usr/bin/debconf-set-selections;',
    unless => '/usr/bin/dpkg -s ttf-mscorefonts-installer'
  } ->
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
