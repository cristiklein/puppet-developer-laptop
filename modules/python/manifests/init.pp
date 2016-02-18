class python {
  
  package { [
    'python-coverage',
    'python-nose',
    'python-unittest2',
  ]:
    ensure => 'installed'
  }

}
