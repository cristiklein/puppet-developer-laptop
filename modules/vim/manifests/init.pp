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

  vcsrepo { "${home}/.vim":
    ensure     => 'present',
    provider   => 'git',
    source     => 'https://github.com/cristiklein/vimrc.git',
    submodules => true,
    depth      => 1,
    user       => $real_id,
    require    => File["${home}/.ssh/id_rsa"],
  }

  file { "${home}/.vimrc":
    ensure => 'link',
    target => "${home}/.vim/.vimrc",
  }

}
