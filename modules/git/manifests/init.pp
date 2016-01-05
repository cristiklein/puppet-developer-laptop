class git {
  
  package { ['git', 'git-gui', 'gitk', 'git-crypt']:
    ensure => 'installed'
  }

  File {
    owner => $real_id,
    group => $real_id,
  }
 
  file { "${home}/.gitconfig":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/gitconfig",
  }

}
