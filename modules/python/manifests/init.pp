class python {
  
  package { [
    'python-coverage',
    'python-nose',
    'python-pip',
    'python-unittest2',
  ]:
    ensure => 'installed'
  }

}
