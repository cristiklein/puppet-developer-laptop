class python {
  
  package { [
    'libpython-dev',
    'python-coverage',
    'python-nose',
    'python-pip',
    'python-unittest2',
  ]:
    ensure => 'installed'
  }

}
