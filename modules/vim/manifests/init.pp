class vim {
  
  package { ['vim']: 
    ensure => 'installed'
  }

  exec { "update-alternatives --set editor /usr/bin/vim.basic":
    path => "/bin:/sbin:/usr/bin:/usr/sbin",
    unless => "test /etc/alternatives/editor -ef /usr/bin/vim.basic"
  }

  File {
    owner => $real_id,
    group => $read_id,
  }

  file { "${home}/.selected_editor":
    ensure => 'present',
    content => '# used the `editor` command',
  }

}
