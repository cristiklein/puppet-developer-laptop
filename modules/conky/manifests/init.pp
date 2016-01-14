class conky {

  # Old config file location, discouraged to migrate to XDG
  file { "${home}/.conkyrc":
    ensure => 'absent',
  }
  
  package { 'conky' : 
    ensure => 'installed'
  }

  file { "${home}/.config/conky":
    ensure => 'directory',
    owner  => $real_id,
    group  => $real_id,
  }
  ->
  file { "${home}/.config/conky/conky.conf":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/conky.conf",
  }
  
  file { "${home}/.config/autostart":
    ensure => 'directory',
    owner  => $real_id,
    group  => $real_id,
  }
  ->
  file { "${home}/.config/autostart/conky.desktop":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/conky.desktop",
  }
}
