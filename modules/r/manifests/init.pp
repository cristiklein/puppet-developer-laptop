include wget

class r {
  
  package { 'r-recommended':
    ensure => 'installed'
  }

  wget::fetch { "RStudio Deb":
    source      => 'https://download1.rstudio.org/rstudio-0.99.893-amd64.deb',
    destination => '/tmp/rstudio-latest.deb',
  }
  ->
  package { "rstudio":
    provider => dpkg,
    ensure   => latest,
    source   => "/tmp/rstudio-latest.deb",
  }


}
