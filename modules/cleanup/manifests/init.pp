class cleanup {
  
  file { "/var/crash":
    ensure  => 'directory',
    purge   => true,
    recurse => true,
  }

  schedule { 'daily_cleanup':
    period => 'daily',
  }

  exec { 'purge old kernels':
    schedule => 'daily_cleanup',
    provider => 'shell',
    command  => "dpkg-query -f='\${Package}\n' --show 'linux-image-*' 'linux-headers-*'| grep -v $(uname -r | egrep -o '[0-9.]+-[0-9]+') | xargs sudo dpkg --purge",
  }
  ->
  exec { 'apt autoremove':
    schedule => 'daily_cleanup',
    command => '/usr/bin/apt autoremove --purge -y',
  }
}
