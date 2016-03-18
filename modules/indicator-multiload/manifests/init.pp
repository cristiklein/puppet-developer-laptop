class indicator-multiload {

  dconf::set { '/de/mh21/indicator-multiload/general/color-scheme':
    value => 'traditional',
    user  => $real_id,
    group => $real_id,
  }

  package { 'indicator-multiload':
    ensure => 'installed'
  }
}
