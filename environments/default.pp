node default {
  include all

  class {'timezone':
    timezone => 'Europe/Stockholm',
  }

}
