# google-chrome-stable installation
class chrome {
 
  apt::key { 'chrome':
    id     => '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991',
    source => 'https://dl-ssl.google.com/linux/linux_signing_key.pub',
  }
 
  apt::source { 'google-chrome':
    location          => 'http://dl.google.com/linux/chrome/deb/',
    release           => 'stable',
    repos             => 'main',
    architecture      => 'amd64',
    include           => { src => false },
    notify            => Package ['google-chrome-stable'],
  }
 
  package { 'google-chrome-stable':
    ensure  => latest,
    require => Class['apt::update'],
  }
 
}
