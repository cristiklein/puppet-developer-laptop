class video-editing {

  include apt

  apt::ppa { 'ppa:openshot.developers/ppa': }
  ->
  package { [
    'openshot-qt',
    'gtk-recordmydesktop',
  ]:
    ensure => 'installed'
  }

}
