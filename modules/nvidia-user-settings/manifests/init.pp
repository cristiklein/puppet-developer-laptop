class nvidia-user-settings {
  
  File {
    owner => $real_id,
    group => $real_id,
  }
 
  file { "${home}/.nvidia-settings-rc":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/nvidia-settings-rc",
  }

  package { 'nvidia-settings':
    ensure => 'present',
  }

  exec { 'load-nvidia-settings':
    require => Package['nvidia-settings'],
    command => 'nvidia-settings --load-config-only',
    path    => '/usr/bin:/bin',
    user    => $real_id,
    subscribe   => File["${home}/.nvidia-settings-rc"],
    refreshonly => true,
  }

}
