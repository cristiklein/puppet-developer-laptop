class cleanup {
  
  file { "/var/crash":
    ensure  => 'directory',
    purge   => true,
    recurse => true,
  }

  exec { 'purge old kernels':
    provider => 'shell',
    command  => "dpkg-query -f='\${Package}\n' --show 'linux-image-*' 'linux-headers-*'| grep -v $(uname -r | egrep -o '[0-9.]+-[0-9]+') | xargs sudo dpkg --purge",
    onlyif   => "test $(dpkg-query -f='\${Version} \${Package}\n' --show 'linux-image-*' 'linux-headers-*' | grep -v '^ ' | grep -v $(uname -r | egrep -o '[0- 9.]+-[0-9]+') | wc -l) -gt 2",
  }

}
