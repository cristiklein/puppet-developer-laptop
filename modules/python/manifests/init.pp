class python {
  
  package { [
    'libpython-dev',
    'python-coverage',
    'python-nose',
    'python-pip',
    'python-unittest2',
    'pylint3',
    'python3-nose',
    'python3-pip',
    'python3-simpy',
  ]:
    ensure => 'installed'
  }

}
