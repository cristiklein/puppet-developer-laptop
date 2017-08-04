include wget

class r {
  
  package { 'r-recommended':
    ensure => 'installed'
  }

  wget::fetch { "RStudio Deb":
    source      => 'https://download1.rstudio.org/rstudio-xenial-1.0.153-amd64.deb',
    source_hash => 'd584cbab01041777a15d62cbef69a976',
    destination => '/tmp/rstudio-latest.deb',
  }
  ->
  package { "rstudio":
    provider => dpkg,
    ensure   => latest,
    source   => "/tmp/rstudio-latest.deb",
  }


}
