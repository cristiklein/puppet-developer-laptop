class git {
  
  package { ['git', 'git-gui', 'gitk', 'git-crypt', 'git-remote-hg']:
    ensure => 'installed'
  }

  File {
    owner => $real_id,
    group => $real_id,
  }
 
  file { "${home}/.gitconfig":
    ensure => 'absent',
  }

  file { "${home}/.config/git":
    ensure => 'directory',
  }

  file { "${home}/.config/git/config":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/gitconfig",
  }

}
