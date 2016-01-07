class spotify-user-config {
  
  File {
    owner => $real_id,
    group => $real_id,
  }
 
  file { "${home}/.config/spotify":
    ensure => 'directory',
  }

  file { "${home}/.config/spotify/prefs":
    source => "puppet:///modules/${module_name}/prefs.key",
  }

}
