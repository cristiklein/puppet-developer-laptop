class mc {
  
  package { ['mc']: 
    ensure => 'installed'
  }

  File {
    owner => $real_id,
    group => $real_id,
  }
 
  file { "${home}/.config/mc":
    ensure => 'directory',
  }

  file { "${home}/.config/mc/panels.ini":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/panels.ini",
  }

}
