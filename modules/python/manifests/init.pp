class python {
  
  package { [
    'python-coverage',
    'python-nose',
  ]:
    ensure => 'installed'
  }

}
