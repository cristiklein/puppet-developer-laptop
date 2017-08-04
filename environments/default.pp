node default {
  include all

  class { 'keyboard':
    layout  => 'ro',
  }

  class { 'nvidia':
    version => 381,
  }

  class {'timezone':
    timezone => 'Europe/Stockholm',
  }

}
