class remove-ubuntu-examples {

  file { "${home}/examples.desktop":
    ensure => 'absent',
  }

}
