class empty-var-crash {
  
  file { "/var/crash":
    ensure  => 'directory',
    purge   => true,
    recurse => true,
  }

}
