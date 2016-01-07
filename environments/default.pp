node default {
  include all

  class { 'keyboard':
    layout  => 'ro',
  }

  class {'timezone':
    timezone => 'Europe/Stockholm',
  }

}
