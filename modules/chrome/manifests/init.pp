# google-chrome-stable installation
class chrome {
 
  apt::key { 'chrome':
    key        => 'A040830F7FAC5991',
    key_source => 'https://dl-ssl.google.com/linux/linux_signing_key.pub',
  }
 
  apt::source { 'google-chrome':
    location          => 'http://dl.google.com/linux/chrome/deb/',
    release           => 'stable',
    repos             => 'main',
    include_src       => false,
    required_packages => 'debian-keyring debian-archive-keyring',
    notify            => Package ['google-chrome-stable'],
  }
 
  package { 'google-chrome-stable':
   ensure => latest,
  }
 
}
