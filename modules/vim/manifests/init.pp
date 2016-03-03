class vim {
  
  package { ['vim', 'vim-gnome']:
    ensure => 'installed'
  }

  exec { "update-alternatives --set editor /usr/bin/vim.gnome":
    path => "/bin:/sbin:/usr/bin:/usr/sbin",
    unless => "test /etc/alternatives/editor -ef /usr/bin/vim.gnome"
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
    notify     => Exec['set-push-url'],
  }

  exec { 'set-push-url':
    cwd         => "${home}/.vim",
    command     => 'git remote set-url --push origin git@github.com:cristiklein/vimrc.git',
    path        => '/usr/bin',
    refreshonly => true,
    user        => $real_id,
  }

  file { "${home}/.vimrc":
    ensure => 'link',
    target => "${home}/.vim/.vimrc",
  }

}
