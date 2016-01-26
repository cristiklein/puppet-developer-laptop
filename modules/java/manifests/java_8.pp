class java::java_8 {
  
  include 'apt'
  
  apt::ppa { 'ppa:webupd8team/java': }
  ->
  exec { 'accept-java-license':
    command => '/bin/echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections;/bin/echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 seen true | sudo /usr/bin/debconf-set-selections;',
    unless  => '/usr/bin/dpkg -s oracle-java8-installer'
  }
  ->
  package { 'oracle-java8-installer' :
    ensure => 'installed'
  }
}
