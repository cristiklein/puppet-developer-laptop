class mplayer-user-config {
 
  File {
    owner => $real_id,
    group => $real_id,
  }

  file { "${home}/.mplayer/config":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/config",
  }
  
}
